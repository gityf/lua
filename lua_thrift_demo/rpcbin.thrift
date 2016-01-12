namespace go demo.rpc
struct ArgStruct {
    1:byte argByte,
    2:i8   argI8,
    3:i16  argI16,
    4:i32  argI32,
    5:i64  argI64,
    6:double argDouble,
    7:string argString
}

service RpcService {
    list<string> funCall(
        1:byte argByte,
        2:i8   argI8,
        3:i16  argI16,
        4:i32  argI32,
        5:i64  argI64,
        6:double argDouble,
        7:string argString,
        8:map<string, string> paramMapStrStr,
        9:map<i32, string> paramMapI32Str,
        10:set<string> paramSetStr,
        11:set<i64> paramSetI64,
        12:list<string> paramListStr,
        13:ArgStruct argStruct,
        ),
}
