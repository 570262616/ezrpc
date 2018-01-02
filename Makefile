
default:	build

build: 
	swift build # This run is to build the template encoder
	.build/debug/TemplateEncoder > Sources/protoc-gen-swiftgrpc/templates.swift
	swift build # This run is to build the plugin
	cp .build/debug/ezrpc ./Plugin
	cp .build/debug/protoc-gen-swiftgrpc ./Plugin
	cp .build/debug/protoc-gen-swift ./Plugin

clean : 
	rm -rf protoc-gen-swiftgrpc Packages .build protoc-gen-swift Package.pins
	rm -rf Package.resolved
