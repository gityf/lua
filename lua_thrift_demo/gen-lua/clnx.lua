require "rpcbin_RpcService"
require "TFramedTransport"
require "TBinaryProtocol"
require "TSocket"

function demoFunc()
    local socket = TSocket:new{
        host='172.21.119.132',
        port=8090
    }
    local protocol = TBinaryProtocol:new{
        trans = socket
    }
    client = RpcServiceClient:new{
        protocol = protocol
    }
    local argStruct = ArgStruct:new{
      argByte = 53,
      argString = "str value",
      argI16 = 54,
      argI32 = 654321,
      argI64 = 334455,
      argDouble = 4334.55
    }
    -- Open the socket  
    socket:open()
    pmap = {}
    pmap.name = "namess"
    pmap.pass = "vpass"
    pistrmap = {}
    pistrmap[2] = "str2"
    pistrmap[3] = "str3"
    ret = client:funCall(argStruct, 65, 2533, 4455,
        98765, 3.2212, "login", pmap,
        pistrmap,
        {"ele1", "ele2", "ele3"},
        {1,2,3,4},
        {"l1","l2","l3"});
    for k,v in pairs(ret)
    do
        print(k, v)
    end
    socket:close()
end
demoFunc()
