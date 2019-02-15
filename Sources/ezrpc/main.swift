import Foundation
import CommandLineKit
import SwiftShell

let cli = CommandLineKit.CommandLine()

let inputOption = StringOption(shortFlag: "i", longFlag: "input", required: true, helpMessage: "proto file path")

let outputOption = StringOption(shortFlag: "o", longFlag: "output", required: true, helpMessage: "generted file path")

cli.addOptions([inputOption, outputOption])

do {
    try cli.parse()
} catch {
    cli.printUsage(error)
    exit(EX_USAGE)
}

guard let i = inputOption.value, let o = outputOption.value else {
    exit(EX_USAGE)
}

let protoPath = run(bash: "cd $(dirname \(i)); pwd").stdout
debugPrint("protoPath = \(protoPath)")

var pathComponents = protoPath.components(separatedBy: "/")

var iComponents = i.components(separatedBy: "/")
iComponents.removeLast()
let defaultSearchPath = iComponents.joined(separator: "/")
var searchPath: String = " -I \(defaultSearchPath)"
for _ in 0..<min(pathComponents.count, 3) {
    searchPath = searchPath + " -I \(pathComponents.joined(separator: "/")) "
    pathComponents.removeLast()
}
let bashCommand = "protoc\(searchPath)--plugin=./protoc-gen-swiftgrpc --plugin=./protoc-gen-swift --swift_opt=Visibility=Public --swiftgrpc_out=\(o) --swift_out=\(o) \(i)"

debugPrint("command = \(bashCommand)")

//let command = run(bash: bashCommand)

let command = run(bash: bashCommand)

//do {
//    try command.finish()
//} catch CommandError.returnedErrorCode(let error) {
//    print(error)
//    exit(EX_USAGE)
//}
//print(command.stderror)
