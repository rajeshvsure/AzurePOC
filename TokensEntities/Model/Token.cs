using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;
using System.ServiceModel;

namespace TokensEntities.Model
{

    [DataContract(Namespace = "http://schemas.datacontract.org/2004/07/TokenGenerator")]
    public class Token
    {
        [DataMember]
        public DateTime GeneratedDate { get; set; }
        [DataMember]
        public string Value { get; set; }
    }
}
