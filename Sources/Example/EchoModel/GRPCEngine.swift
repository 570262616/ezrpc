//
//  File.swift
//  
//
//  Created by zhangpeng on 2020/3/30.
//

import Foundation
import GRPC

public var grpcEngine: GRPCEngine? = nil

//public protocol GRPCEngineClient: class {
//    func needLimit(api: String) -> (Bool, Error?)
//    func loginGuest(with metadata: Metadata)
//}

public protocol GRPCEngine: class {
    
    var client: GRPCClient { get }
    
    var isUAT: Bool { get }
}


