import Foundation
import CommandLine
import SwiftShell

let cli = CommandLine()

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

let command = runAsync("protoc", i, "--proto_path=../apidoc/proto/", "--plugin=./protoc-gen-swiftgrpc", "--plugin=./protoc-gen-swift", "--swift_opt=Visibility=Public", "--swiftgrpc_out=\(o)", "--swift_out=\(o)")

do {
    try command.finish()
} catch CommandError.returnedErrorCode(let error) {
    print(error)
    exit(EX_USAGE)
}
