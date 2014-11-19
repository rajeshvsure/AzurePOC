using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TokenGenerator
{
    class TokenGeneratorService:ITokenServiceContract
    {
        public Token GetToken()
        {
            return new Token { 
                GeneratedDate = DateTime.Now,
                Value = Guid.NewGuid().ToString()
            };
        }
    }
}
