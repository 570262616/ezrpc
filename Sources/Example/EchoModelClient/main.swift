//
//  File.swift
//  
//
//  Created by zhangpeng on 2020/3/28.
//

import Foundation
import EchoModel
import GRPC
import NIO
import NIOHTTP1
import NIOSSL
import NIOHPACK

var shouldExit = false


public func testGRPC() {

    print("Test")


    var s = GEUserGetMessagesRequest()
    s.limit = Int32(arc4random() % UInt32(20))
    s.offset = 0

    

//    let group = MultiThreadedEventLoopGroup(numberOfThreads: 4)

//    let pem = try! NIOSSLCertificate.fromPEMFile("/Users/zhangpeng/Downloads/warehouse/ezrpc/Sources/Example/GRPCCrt/rpc.65emall.net.crt")
//
//    debugPrint("crt", pem)

//    let channel = ClientConnection.secure(group: group)
////            .withTLS(certificateChain: pem)
//            .withTLS(trustRoots: .certificates(pem))
//            .connect(host: "sg-en-ios-rpc3.65emall.net", port: 2443)
    
    GECustomerMessageClient.UserGetMessages(request: s, completion: { (resp) in
        
//        print(resp)
    }) { (error) in
//        print(error)
    }

//    let client = GECustomerMessageClient(channel: channel, defaultCallOptions: makeOptions())
//
//    let call = client.userGetMessages(s)
//
//    do {
//       let s = try call.response.wait()
//
//        print(s)
//    } catch {
//        print(error)
//    }


}

grpcEngine = Client()

for i in 0..<1000 {
    
    let q = DispatchQueue(label: "\(i)", qos: .userInitiated)
    
    q.async {
        print(i)
//        print(Thread.current, "Thread")
        testGRPC()
    }
}


//extension GRAppClient {
//
//    public static func search(_ request: GRAppSearch, completion: @escaping (GRAppSearchResp) -> Void, failure: @escaping (Error) -> Void) -> UnaryCall<GRAppSearch, GRAppSearchResp> {
//
//        let client = GRAppClient(channel: makeChannel(), defaultCallOptions: makeOptions())
//
//        let call = client.search(request)
//
//        call.response.whenComplete { (result) in
//
//            switch result {
//            case .success(let resp):
//                completion(resp)
//            case .failure(let error):
//                failure(error)
//            }
//        }
//
////        call.response.always { (result) in
////
////            switch result {
////            case .success(let resp):
////                completion(resp)
////            case .failure(let error):
////                failure(error)
////            }
////        }
//
//        do {
//           let s = try call.response.wait()
//
//            print(s)
//        } catch let err {
//            print(err)
//        }
//
//        return call
//    }
//
////    public static func getMineService(_ request: NadesicoGetMineServiceReq) throws -> NadesicoGetMineServiceResp {
////
////        let client = NadesicoCustomerServiceClient(connection: makeClientConnection(), defaultCallOptions: makeOptions())
////
////        let call = client.getMineService(request)
////
////        return try call.response.wait()
////    }
//}

func makeClientConnection() -> ClientConnection {

    let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    //    defer {
    //        try? group.syncShutdownGracefully()
    ////        group.shutdownGracefully(queue: .global()) { (err) in
    ////            print(err)
    ////        }
    ////        group.shutdownGracefully { (err) in
    ////            print(err)
    ////        }
    //    }

    let configuration = ClientConnection.Configuration(

            // dev insecure
            target: .hostAndPort("sg-en-ios-rpc4.65emall.net", 2080),
            eventLoopGroup: group

            // dev secure
    //         target: .hostAndPort("sg-en-ios-rpc2.ezbuy.sg", 2443),
    //         eventLoopGroup: group,
    //         tls: .init(certificateChain: try! NIOSSLCertificate.fromPEMFile("/Users/zhangpeng/Downloads/warehouse/ezrpc/Sources/ezrpc/GRPCCrt/rpc.ezbuy.sg.crt").map { .certificate($0) })
        )

    let connection = ClientConnection(configuration: configuration)

    return connection
}

func makeOptions() -> CallOptions {
    
    var header = HPACKHeaders()
    header.add(name: "platform", value: "ios")
    header.add(name: "area", value: "sg" )
    header.add(name: "version", value: "9140" )
    header.add(name: "ip", value: "11")
    header.add(name: "devicetoken", value: "11")
    header.add(name: "language", value: "en" )
    header.add(name: "isuat", value: "")

    
//    if let cookie = self.customer?.cookie {
//        if self.customer?.isGuest == true {
//            header.add(name: "cookie", value: cookie)
//        } else {
            header.add(name: "cookie", value: "65_customer=9FC6318939BC3D35,DPSA:1jaeZX:AYuA9SMDYXTRcGEFBxqGyqB55Sc")
//        }
//    } else {
//        header.add(name: "cookie", value: "")
//    }
    var option = CallOptions(customMetadata: header)
    option.cacheable = false
    option.timeout = GRPCTimeout.default
    
    return option
}

//func makeChannel() -> GRPCChannel {
//
//    let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
//
//    let channel = ClientConnection.insecure(group: group)
//      .connect(host: "sg-en-ios-rpc2.65emall.net", port: 2080)
//
//    return channel
//}


func makeChannel() -> GRPCChannel {
    
    let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    
    let pem = try! NIOSSLCertificate.fromPEMFile("/Users/zhangpeng/Downloads/warehouse/ezrpc/Sources/Example/GRPCCrt/rpc.ezbuy.sg.crt")

    debugPrint("crt", pem)
    
    let channel = ClientConnection.insecure(group: group)
//        .withTLS(trustRoots: .certificates(pem))
      .connect(host: "sg-en-android-rpc4.ezbuy.sg", port: 2080)
    
    return channel
}

class Client: GRPCEngine {

    var client: GRPCClient
    
    var isUAT: Bool { return false }
    
    init() {
        self.client = C.init(channel: makeChannel(), defaultCallOptions: makeOptions())
    }
}

class C: NSObject, GRPCClient {
    
    public let channel: GRPCChannel
    public var defaultCallOptions: CallOptions

    /// Creates a client which may be used to call any service.
    ///
    /// - Parameters:
    ///   - connection: `ClientConnection` to the service host.
    ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
    public required init(channel: GRPCChannel, defaultCallOptions: CallOptions) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        
        super.init()
    }
    
}

autoreleasepool {
    let runLoop = RunLoop.current
    while (!shouldExit && (runLoop.run(mode: RunLoop.Mode.default, before: Date.distantFuture))) {}
}


func Get(payload) {
//    grpc.req()
    
    service = usermsgcenter.Echo
    
    let client = grpc.makeClient("usermsgcenter.Echo")

    client.makeUnryCall(payload).wait()
}



