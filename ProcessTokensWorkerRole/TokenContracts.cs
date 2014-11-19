using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;
using System.Runtime.Serialization;
using Microsoft.WindowsAzure.Storage.Table;

namespace TokenProcessingWorkerRole
{
    [DataContract(Namespace = "http://schemas.datacontract.org/2004/07/TokenGenerator")]
    public class Token
    {
        [DataMember]
        public DateTime GeneratedDate { get; set; }
        [DataMember]
        public string Value { get; set; }
    }

    interface ITokens
    {
        [OperationContract]
        Token GetToken();
    }

    interface ITokenChannel : ITokens, IClientChannel
    { 
    }

    public class TokenEntity : TableEntity
    {
        [DataMember]
        public DateTime GeneratedDate { get; set; }
        [DataMember]
        public string Value { get; set; }

        public TokenEntity()
        {
            PartitionKey = "Tokens";
            RowKey = DateTime.Now.Ticks.ToString();
        }
    }
}
