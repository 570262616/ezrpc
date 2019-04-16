// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ezrpc",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(
            name: "ezrpc",
            targets: ["ezrpc"]),
    ],
    dependencies: [
        .package(url: "https://github.com/570262616/CommandLine.git", from: "5.0.4"),
        .package(url: "https://github.com/kareman/SwiftShell", from: "4.0.0"),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.5.0"),
        .package(url: "https://github.com/stencilproject/Stencil.git", from: "0.13.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "ezrpc",
            dependencies: ["CommandLine", "SwiftShell"],
            path: "Sources/ezrpc/"
        ),
        .target(
            name: "TemplateEncoder",
            dependencies: ["Stencil", "SwiftProtobuf", "SwiftProtobufPluginLibrary", "protoc-gen-swift"],
            path: "Sources/TemplateEncoder"),
        .target(
            name: "protoc-gen-swiftgrpc",
            dependencies: ["TemplateEncoder"],
            path: "Sources/protoc-gen-swiftgrpc"
        ),
        .testTarget(
            name: "ezrpcTests",
            dependencies: ["ezrpc"]),
    ]
)
