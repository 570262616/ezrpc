
default:	build

# build: clear
# 	swift build # This run is to build the template encoder
# 	.build/debug/TemplateEncoder > Sources/protoc-gen-swiftgrpc/templates.swift
# 	swift build # This run is to build the plugin
# 	cp .build/debug/ezrpc ./Plugin
# 	cp .build/debug/protoc-gen-swiftgrpc ./Plugin
# 	cp .build/debug/protoc-gen-swift ./Plugin

build:
	swift build --product ezrpc -c release
	swift build --product protoc-gen-swift -c release
	swift build --product protoc-gen-grpc-swift -c release
	swift build --product protoc-gen-swiftgrpc -c release
	cp .build/release/ezrpc ./Plugin
	cp .build/release/protoc-gen-swift ./Plugin
	cp .build/release/protoc-gen-grpc-swift ./Plugin
	cp .build/release/protoc-gen-swiftgrpc ./Plugin


gen:
	protoc ./Example/echo.proto --proto_path=./Example/ --plugin=./Plugin/protoc-gen-swiftgrpc --plugin=./Plugin/protoc-gen-swift --grpc-swift_opt=Visibility=Public --swift_opt=Visibility=Public --grpc-swift_opt=Client=true,Server=false --grpc-swift_out=./Generated --swift_out=./Generated

clear : 
	rm -f ./Generated/*

clean : 
	rm -rf protoc-gen-swiftgrpc Packages .build protoc-gen-swift Package.pins
	rm -rf Package.resolved

install:
	brew tap grpc/grpc
	brew install protobuf

project:
	swift package generate-xcodeproj

test-ezrpc:
	./Plugin/ezrpc -i ./Example/echo.proto -o ./Generated -t EZBuy

swift5:
	https://download.developer.apple.com/Developer_Tools/Swift_5_Runtime_Support_for_Command_Line_Tools/Swift_5_Runtime_Support_for_Command_Line_Tools.dmg

copy:
	cp -r .build/checkouts/grpc-swift/Sources/protoc-gen-grpc-swift/. ./Sources/protoc-gen-swiftgrpc
