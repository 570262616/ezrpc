
default:	build

build: clear
	swift build # This run is to build the template encoder
	.build/debug/TemplateEncoder > Sources/protoc-gen-swiftgrpc/templates.swift
	swift build # This run is to build the plugin
	cp .build/debug/ezrpc ./Plugin
	cp .build/debug/protoc-gen-swiftgrpc ./Plugin
	cp .build/debug/protoc-gen-swift ./Plugin

gen: build
	protoc ./Example/echo.proto --proto_path=./Example/ --plugin=./Plugin/protoc-gen-swiftgrpc --plugin=./Plugin/protoc-gen-swift --swiftgrpc_out=./Generated --swift_out=./Generated

clear : 
	rm -f ./Generated/*

clean : 
	rm -rf protoc-gen-swiftgrpc Packages .build protoc-gen-swift Package.pins
	rm -rf Package.resolved

install:
	brew tap grpc/grpc
	brew install protobuf