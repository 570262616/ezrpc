import Foundation

//let cli = CommandLine()
//
//let inputOption = StringOption(shortFlag: "i", longFlag: "input", required: true, helpMessage: "proto file path")
//
//let outputOption = StringOption(shortFlag: "o", longFlag: "output", required: true, helpMessage: "generted file path")
//
//let clientTypeOption = StringOption(shortFlag: "t", longFlag: "clientType", required: true, helpMessage: "clientType eg. EZBuy or EZBuyint")
//
//cli.addOptions([inputOption, outputOption, clientTypeOption])
//
//do {
//    try cli.parse()
//} catch {
//    cli.printUsage(error)
//    exit(EX_USAGE)
//}
//
////splitPath
//
//guard let i = inputOption.value, let o = outputOption.value, let t = clientTypeOption.value else {
//    exit(EX_USAGE)
//}
//
//var pathComponents = URL(string: i)!.pathComponents
//pathComponents.removeLast()
//let path = pathComponents.joined(separator: "/")
//
//let command = runAsync("protoc",
//                       i,
//                       "--proto_path=\(path)",
//                       "--plugin=./protoc-gen-swiftgrpc",
//                       "--plugin=./protoc-gen-swift",
//                       "--swift_opt=Visibility=Public",
//                       "--swiftgrpc_opt=ClientType=\(t)",
//                       "--swiftgrpc_out=\(o)",
//                        "--swift_out=\(o)")
//
//do {
//    try command.finish()
//} catch CommandError.returnedErrorCode(let error) {
//    print(error)
//    exit(EX_USAGE)
//}


