using Microsoft.WindowsAzure.Storage.Table;
using Microsoft.WindowsAzure.Storage.Table.DataServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TokenStorageTable
{
    public class TokenEntitiy : TableEntity
    {
        public DateTime GeneratedDate { get; set; }
        public string Value { get; set; }

        public TokenEntitiy()
        {
            PartitionKey = "Tokens";
            RowKey = DateTime.Now.Ticks.ToString();
        }
    }
}