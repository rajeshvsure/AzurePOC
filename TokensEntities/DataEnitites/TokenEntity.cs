using Microsoft.WindowsAzure.Storage.Table;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace TokensEntities.DataEnitites
{
    public class TokenEntity : TableEntity
    {
        [DataMember]
        public DateTime GeneratedDate { get; set; }
        [DataMember]
        public string Value { get; set; }

        public TokenEntity()
        {
            PartitionKey = "Tokens";
            RowKey = (DateTime.Now.Ticks - DateTime.MinValue.Ticks).ToString();
        }
    }
}
