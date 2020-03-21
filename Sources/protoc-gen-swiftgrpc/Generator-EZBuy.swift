/*
 * Copyright 2018, gRPC Authors All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import Foundation
import SwiftProtobuf
import SwiftProtobufPluginLibrary

extension Generator {
  internal func printEZBuyClient() {
    println()
    printServiceClientImplementation()
  }
    
  private func printServiceClientImplementation() {
    println("\(access) final class \(clientClassName) {")
    println()
    indent()
    for method in service.methods {
      self.method = method
      switch streamingType(method) {
      case .unary:
        println("/// Asynchronous unary call to \(method.name).")
        println("///")
        printParameters()
        printRequestParameter()
        printCallOptionsParameter()
        println("/// - Returns: A `UnaryCall` with futures for the metadata, status and response.")
        println("@discardableResult")
        println("\(access) static func \(methodFunctionName)(_ request: \(methodInputName), completion: @escaping (\(methodOutputName)) -> Void, failure: @escaping (Error) -> Void) -> Bool {")
        indent()
        println("guard let grpcEngine = grpcEngine  else { return false }")
        println("let client = grpcEngine.client")

        println("let call = client.makeUnaryCall(path: \"/\(servicePath)/\(method.name)\",")
        println("                          request: request,")
        println("                          callOptions: client.defaultCallOptions, responseType: \(methodOutputName).self)")
        println("call.response.whenComplete { (result) in")
        println("   switch result {")
        println("       case .success(let resp):")
        println("           debugPrint(\"/\(servicePath)/\(method.name) resp:\", resp)")
        println("           DispatchQueue.main.async { completion(resp) }")
        println("       case .failure(let error):")
        println("           debugPrint(\"/\(servicePath)/\(method.name) error\", error)")
        println("           DispatchQueue.main.async { failure(error) }")
        println("   }")
        println("}")
        println("return true")
        outdent()
        println("}")


      default:
        println("其他模式暂时不支持")
      }
      println()
    }
    outdent()
    println("}")
  }

  private func printClientStreamingDetails() {
    println("/// Callers should use the `send` method on the returned object to send messages")
    println("/// to the server. The caller should send an `.end` after the final message has been sent.")
  }

  private func printParameters() {
    println("/// - Parameters:")
  }

  private func printRequestParameter() {
    println("///   - request: Request to send to \(method.name).")
  }

  private func printCallOptionsParameter() {
    println("///   - callOptions: Call options; `self.defaultCallOptions` is used if `nil`.")
  }

  private func printHandlerParameter() {
    println("///   - handler: A closure called when each response is received from the server.")
  }
}
