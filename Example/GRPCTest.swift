import Generated
import Foundation
import SwiftProtobuf
import NIO
import GRPC
import NIOHPACK
import NIOSSL



//public func testGRPC() {
//
//    print("Test")
//
//
//    var s = GRUserGetMessagesRequest()
//    s.limit = 20
//    s.offset = 0
//
////    let call = GRAppClient.search(s, completion: { (resp) in
////        print("Resp:", resp)
////    }, failure: { (err) in
////        print("Error:", err)
////    })
//
////    let path = Bundle.main.path(forResource: "rpc.65emall.net", ofType: "crt")!
////
////    debugPrint("crt", path)
//
//    let group = MultiThreadedEventLoopGroup(numberOfThreads: 4)
//
//    let pem = try! NIOSSLCertificate.fromPEMFile("/Users/zhangpeng/Downloads/warehouse/ezrpc/Example/GRPCCrt/rpc.65emall.net.crt")
//
//    debugPrint("crt", pem)
//
//    let channel = ClientConnection.secure(group: group)
////            .withTLS(certificateChain: pem)
//            .withTLS(trustRoots: .certificates(pem))
//            .connect(host: "sg-en-ios-rpc3.65emall.net", port: 2443)
//
//    let client = GRCustomerMessageClient(channel: channel, defaultCallOptions: makeOptions())
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
//
//
//}

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
            target: .hostAndPort("sg-en-ios-rpc2.65emall.net", 2080),
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
    header.add(name: "isuat", value: "uat")

    
//    if let cookie = self.customer?.cookie {
//        if self.customer?.isGuest == true {
//            header.add(name: "cookie", value: cookie)
//        } else {
            header.add(name: "cookie", value: "65_customer=26AC131D29EB9CDB,DPSA:1jH2oy:yAfS60RI0NjtTwRglkbb6A02yvQ")
//        }
//    } else {
//        header.add(name: "cookie", value: "")
//    }
    let option = CallOptions(customMetadata: header)
    
    return option
}

func makeChannel() -> GRPCChannel {
    
    let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    
    let channel = ClientConnection.insecure(group: group)
      .connect(host: "sg-en-ios-rpc2.65emall.net", port: 2080)
    
    return channel
}

