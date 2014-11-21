using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Table;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using TokensEntities.DataEnitites;
using TokensEntities.Model;
using TokensWebRole.Models;

namespace TokensWebRole.Services
{
    public static class TokenService
    {
        // Retrieve the storage account from the connection string.
        static CloudStorageAccount storageAccount = CloudStorageAccount.Parse(
                            CloudConfigurationManager.GetSetting("StorageConnectionString"));

        //static CloudStorageAccount storageAccount = CloudStorageAccount.Parse(
        //                    ConfigurationManager.ConnectionStrings["StorageConnectionString"].ToString());


        // Create the table client.
        static CloudTableClient tableClient = storageAccount.CreateCloudTableClient();

        const string TableName = "TokenStore";


        // Create the table if it doesn't exist.
        static CloudTable table = tableClient.GetTableReference(TableName);

        public static Token GetActiveToken()
        {
            
            TableQuery<TokenEntity> query = new TableQuery<TokenEntity>();

            TokenEntity tokenRow = table.ExecuteQuery(query).OrderByDescending(token => token.RowKey).FirstOrDefault();

            return new Token() { GeneratedDate =  tokenRow.GeneratedDate, Value = tokenRow.Value };
        }
    }
}