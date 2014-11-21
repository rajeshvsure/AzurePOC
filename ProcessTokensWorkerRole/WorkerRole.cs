using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading;
using Microsoft.ServiceBus;
using Microsoft.ServiceBus.Messaging;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.ServiceRuntime;
using System.ServiceModel;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Table;
using TokensEntities.Model;
using TokensEntities.DataEnitites;


namespace ProcessTokensWorkerRole
{
    public class WorkerRole : RoleEntryPoint
    {
        // The name of your queue
        const string QueueName = "TokensQueue";

        const string TableName = "TokenStore";

        // QueueClient is thread-safe. Recommended that you cache 
        // rather than recreating it on every request
        QueueClient Client;
        ManualResetEvent CompletedEvent = new ManualResetEvent(false);

        public override void Run()
        {
            Trace.WriteLine("Starting processing of messages");

            // Initiates the message pump and callback is invoked for each message that is received, calling close on the client will stop the pump.
            Client.OnMessage((receivedMessage) =>
                {
                    try
                    {
                        var message = receivedMessage.GetBody<Token>();
                        var token = new TokenEntity { GeneratedDate = message.GeneratedDate, Value = message.Value };
                        // Process the message
                        Trace.WriteLine("Processing Service Bus message: " + token);
                        // Retrieve the storage account from the connection string.
                        CloudStorageAccount storageAccount = CloudStorageAccount.Parse(
                            CloudConfigurationManager.GetSetting("StorageConnectionString"));

                        // Create the table client.
                        CloudTableClient tableClient = storageAccount.CreateCloudTableClient();

                        // Create the table if it doesn't exist.
                        CloudTable table = tableClient.GetTableReference(TableName);

                        TableOperation insertOperation = TableOperation.Insert(token);
                        table.Execute(insertOperation);

                        receivedMessage.Complete();

                        //Get all the tokens so far
                        // Construct the query operation for all customer entities where PartitionKey="Smith".
                        TableQuery<TokenEntity> query = new TableQuery<TokenEntity>();

                        // Print the fields for each customer.
                        foreach (TokenEntity entity in table.ExecuteQuery(query))
                        {
                            Trace.WriteLine(string.Format("{0}, {1}\t{2}\t{3}", entity.PartitionKey, entity.RowKey,
                                entity.GeneratedDate, entity.Value));
                        }
                    }
                    catch(Exception ex)
                    {
                        // Handle any message processing specific exceptions here
                        Trace.WriteLine(ex.Message);
                        receivedMessage.Abandon();
                    }
                });

            CompletedEvent.WaitOne();
        }

        public override bool OnStart()
        {
            // Set the maximum number of concurrent connections 
            ServicePointManager.DefaultConnectionLimit = 12;

            // Create the queue if it does not exist already
            string connectionString = CloudConfigurationManager.GetSetting("Microsoft.ServiceBus.ConnectionString");
            var namespaceManager = NamespaceManager.CreateFromConnectionString(connectionString);
            if (!namespaceManager.QueueExists(QueueName))
            {
                namespaceManager.CreateQueue(QueueName);
            }

            // Initialize the connection to Service Bus Queue
            Client = QueueClient.CreateFromConnectionString(connectionString, QueueName);

            // Retrieve the storage account from the connection string.
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(
                CloudConfigurationManager.GetSetting("StorageConnectionString"));

            // Create the table client.
            CloudTableClient tableClient = storageAccount.CreateCloudTableClient();

            // Create the table if it doesn't exist.
            CloudTable table = tableClient.GetTableReference(TableName);
            table.CreateIfNotExists();
            return base.OnStart();
        }

        public override void OnStop()
        {
            // Close the connection to Service Bus Queue
            Client.Close();
            CompletedEvent.Set();
            base.OnStop();
        }
    }
}
