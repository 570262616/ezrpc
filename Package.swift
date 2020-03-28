// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "protoc-gen-swiftgrpc",
    platforms: [
      // We can't use `.watchOS(.v6)` since it isn't available with `swift-tools-version:5.0`.
      .macOS(.v10_12), .iOS(.v10), .tvOS(.v10), .watchOS("6.0")
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
//        .library(name: "Generated", targets: ["Generated"]),
//        .library(name: "Example", targets: ["Example"]),
//        .executable(
//            name: "ezrpc",
//            targets: ["ezrpc"]),
        .executable(
            name: "protoc-gen-swiftgrpc",
            targets: ["protoc-gen-swiftgrpc"]),
        
    ],
    dependencies: [
//        .package(url: "https://github.com/570262616/CommandLine.git", from: "5.0.4"),
//        .package(url: "https://github.com/kareman/SwiftShell", from: "4.0.0"),
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.0.0-alpha.10"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.7.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
//        .target(
//            name: "ezrpc",
//            dependencies: ["Example"],
//            path: "Sources/ezrpc/"
//        ),
//        .target(
//            name: "Generated",
//            dependencies: ["GRPC"],
//            path: "Generated"
//        ),
        .target(
            name: "protoc-gen-swiftgrpc",
            dependencies: [
//                "protoc-gen-grpc-swift"
                "SwiftProtobuf",
                "SwiftProtobufPluginLibrary",
                "protoc-gen-swift"
            ],
            path: "Sources/protoc-gen-swiftgrpc"
        ),
//        .target(
//            name: "Example",
//            dependencies: [
//                "GRPC", "Generated"
//            ],
//            path: "Example"
//        ),
        
    ]
)
