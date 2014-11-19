﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;
using System.ServiceModel;

namespace TokenGenerator
{
    [ServiceContract]
    public interface ITokenServiceContract
    {
        [OperationContract]
        Token GetToken();
    }
}
