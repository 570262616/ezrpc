import Generated
import Foundation
import SwiftProtobuf
import NIO
import GRPC
import NIOHPACK
import NIOSSL

func testGRPC() {
    
    print("Test")
    
    var x = GRXSearch()
    x.keyword = "shose"
    
    
    var s = GRAppSearch()
    s.limit = 100
    s.offset = 0
    s.search = x

    let call = GRAppClient.search(s, completion: { (resp) in
        print("Resp:", resp)
    }, failure: { (err) in
        print("Error:", err)
    })
    
    
    
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
    
    let header = HPACKHeaders([("platform", "ios"), ("area","sg"), ("isuat","uat")])
    

    let option = CallOptions(customMetadata: header)
    
    return option
}

func makeChannel() -> GRPCChannel {
    
    let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    
    let channel = ClientConnection.insecure(group: group)
      .connect(host: "sg-en-ios-rpc2.65emall.net", port: 2080)
    
    return channel
}

