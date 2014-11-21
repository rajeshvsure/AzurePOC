using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;
using Microsoft.WindowsAzure;
using Microsoft.ServiceBus;
using Microsoft.ServiceBus.Messaging;
using System.Threading;
using TokensEntities;
using TokensEntities.Model;

namespace TokenGenerator
{
    class Program
    {
        const string QueueName = "TokensQueue";
        // QueueClient is thread-safe. Recommended that you cache 
        // rather than recreating it on every request
        static QueueClient client;
        
        static void Main(string[] args)
        {
        //    var sh = new ServiceHost(typeof(TokenGeneratorService));
        //    sh.Open();

        //    Console.WriteLine("Press ENTER to close");
        //    Console.ReadLine();

        //    sh.Close();
            Console.WriteLine("Press ESC to stop");
            // Create the queue if it does not exist already
            string connectionString = CloudConfigurationManager.GetSetting("Microsoft.ServiceBus.ConnectionString");
            var namespaceManager = NamespaceManager.CreateFromConnectionString(connectionString);
            if (!namespaceManager.QueueExists(QueueName))
            {
                namespaceManager.CreateQueue(QueueName);
            }

            // Initialize the connection to Service Bus Queue
            client = QueueClient.CreateFromConnectionString(connectionString, QueueName);

            do
            {
                while (!Console.KeyAvailable)
                {
                    var token = new Token { GeneratedDate = DateTime.Now, Value = Guid.NewGuid().ToString() };
                    BrokeredMessage message = new BrokeredMessage(token);
                    message.TimeToLive = new TimeSpan(0, 0, 10);

                    // Do something
                    client.Send(message);
                    Thread.Sleep(3000);
                }
            } while (Console.ReadKey(true).Key != ConsoleKey.Escape);
        }
    }
}
