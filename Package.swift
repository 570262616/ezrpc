// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "protoc-gen-ezgrpc",
    platforms: [
      .macOS(.v10_15),
    ],
    products: [
//        .executable(
//            name: "ezrpc",
//            targets: ["ezrpc"]),
        .executable(
            name: "protoc-gen-swift-grpc",
            targets: ["protoc-gen-swift-grpc"]),
        .executable(
            name: "protoc-gen-kotlin-grpc",
            targets: ["protoc-gen-kotlin-grpc"]),
        
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift", from: "1.0.0-alpha.18"),
        .package(name: "SwiftProtobuf", url: "https://github.com/apple/swift-protobuf", from: "1.11.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
//        .target(
//            name: "ezrpc",
//            dependencies: [
//            ],
//            path: "Sources/ezrpc"
//        ),
        .target(
            name: "protoc-gen-swift-grpc",
            dependencies: [
                .product(name: "SwiftProtobuf", package: "SwiftProtobuf"),
                .product(name: "SwiftProtobufPluginLibrary", package: "SwiftProtobuf"),
                .product(name: "protoc-gen-swift", package: "SwiftProtobuf"),
            ],
            path: "Sources/protoc-gen-swift-grpc"
        ),
        .target(
            name: "protoc-gen-kotlin-grpc",
            dependencies: [
                .product(name: "SwiftProtobuf", package: "SwiftProtobuf"),
                .product(name: "SwiftProtobufPluginLibrary", package: "SwiftProtobuf"),
                .product(name: "protoc-gen-swift", package: "SwiftProtobuf"),
            ],
            path: "Sources/protoc-gen-kotlin-grpc"
        ),
        // Model for the HelloWorld example
        .target(
          name: "EchoModel",
          dependencies: [
            .product(name: "GRPC", package: "grpc-swift"),
            .product(name: "SwiftProtobuf", package: "SwiftProtobuf"),
          ],
          path: "Sources/Example/EchoModel/"
        ),
        // Client for the HelloWorld example
        .target(
          name: "EchoModelClient",
          dependencies: [
            .product(name: "GRPC", package: "grpc-swift"),
            "EchoModel",
          ],
          path: "Sources/Example/EchoModelClient"
        ),
        
    ]
)
