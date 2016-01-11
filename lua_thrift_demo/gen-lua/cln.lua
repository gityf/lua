require "rpc_RpcService"
require "TBinaryProtocol"
require "TSocket"

function demoFunc()
    local socket = TSocket:new{
        host='127.0.0.1',
        port=8090
    }
    local protocol = TBinaryProtocol:new{
        trans = socket
    }
    client = RpcServiceClient:new{
        protocol = protocol
    }
    -- Open the socket  
    socket:open()
    pmap = {}
    pmap.name = "namess"
    pmap.pass = "vpass"
    ret = client:funCall(1, "login", pmap);
    for k,v in pairs(ret)
    do
        print(k, v)
    end
    socket:close()
end
demoFunc()
