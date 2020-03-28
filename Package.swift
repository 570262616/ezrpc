// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "protoc-gen-ezgrpc",
    platforms: [
      // We can't use `.watchOS(.v6)` since it isn't available with `swift-tools-version:5.0`.
      .macOS(.v10_12), .iOS(.v10), .tvOS(.v10), .watchOS("6.0")
    ],
    products: [
        .executable(
            name: "protoc-gen-ezgrpc",
            targets: ["protoc-gen-ezgrpc"]),
        
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.0.0-alpha.10"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.7.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "protoc-gen-ezgrpc",
            dependencies: [
                "SwiftProtobuf",
                "SwiftProtobufPluginLibrary",
                "protoc-gen-swift"
            ],
            path: "Sources/protoc-gen-ezgrpc"
        ),
        // Model for the HelloWorld example
        .target(
          name: "EchoModel",
          dependencies: [
            "GRPC",
            "NIO",
            "NIOHTTP1",
            "SwiftProtobuf"
          ],
          path: "Sources/Example/EchoModel/"
        ),
        // Client for the HelloWorld example
        .target(
          name: "EchoModelClient",
          dependencies: [
            "GRPC",
            "EchoModel",
          ],
          path: "Sources/Example/EchoModelClient"
        ),
        
    ]
)
