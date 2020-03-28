
default:	build

build:
	swift build --product protoc-gen-swift -c release
	swift build --product protoc-gen-ezgrpc -c release
	cp .build/release/protoc-gen-swift ./Plugin
	cp .build/release/protoc-gen-ezgrpc ./Plugin


gen:
	protoc ./Example/EchoModel/echo.proto --proto_path=./Example/ --plugin=./Plugin/protoc-gen-ezgrpc --plugin=./Plugin/protoc-gen-swift --swiftgrpc_opt=Visibility=Public --swift_opt=Visibility=Public --swiftgrpc_opt=Client=true,Server=false --swiftgrpc_out=./Example/EchoModel --swift_out=./Example/EchoModel

clear : 
	rm -f ./Example/EchoModel/echo.pb.swift
	rm -f ./Example/EchoModel/echo.pb.client.swift

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
