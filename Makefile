

plugins=--plugin=./Plugin/protoc-gen-ezgrpc --plugin=./Plugin/protoc-gen-swift

options=--ezgrpc_opt=Visibility=Public \
--ezgrpc_opt=Client=true,Server=false \
--swift_opt=Visibility=Public \
--ezgrpc_opt=FileNaming=PathToUnderscores \
--swift_opt=FileNaming=PathToUnderscores  \
--ezgrpc_opt=ExcludeExtesion=COEmpty

out=--ezgrpc_out=./Sources/Example/EchoModel --swift_out=./Sources/Example/EchoModel

default:	build

build:
	swift build --product protoc-gen-swift -c release
	swift build --product protoc-gen-ezgrpc -c release
	cp .build/release/protoc-gen-swift ./Plugin
	cp .build/release/protoc-gen-ezgrpc ./Plugin


gen:

	./Plugin/protoc ./Sources/Example/EchoModel/echo.proto --proto_path=./Sources/Example/ $(plugins) $(options) $(out)
	
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
