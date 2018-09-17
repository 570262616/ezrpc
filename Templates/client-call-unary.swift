
    /// {{ method|methodDescriptorName }} (Unary)
    public static func {{ method|methodDescriptorName }}(request: {{ method|input }}, completion: @escaping ({{ .method|output }}) -> Void, failure: @escaping (Error) -> Void) {

        guard let grpcEngine = grpcEngine else { return }

        let api = "{{ .|path:file,service,method }}"
        
        var debugObject: DebugObject? = nil
        if debugEngine != nil {
            debugObject = DebugObject(identifier: api)
        }

        debugObject?.content.append("-------------Start-------------------" as AnyObject)
        debugObject?.content.append("api: " + "\(api)" as AnyObject)
        debugObject?.content.append("metadata: \n" + grpcEngine.grpcClient.metadata.description as AnyObject)

        let result = grpcEngine.grpcClient.needLimit(api: api)
        guard !result.0 else {
            let error = GRPCError(errorCode: 100001, errorUserInfo: [NSLocalizedDescriptionKey:""])
            failure(result.1 ?? error)
            return
        }

        do{
            
            let requestData = try request.serializedData()
            let requestMetadata = grpcEngine.grpcClient.metadata
            let call = grpcEngine.grpcClient.channel.makeCall(api)
            
            debugPrint(api, "req:", request)
            debugObject?.content.append("req: " as AnyObject)
            debugObject?.content.append(request as AnyObject)
            
            try call.ezPerform(message: requestData, metadata: requestMetadata) { (callResult) in
                
                if let responseData = callResult.resultData, let response = try? {{ method|output }}(serializedData:responseData) {
                    DispatchQueue.main.async {
                        completion(response)
                    }
                    debugPrint(api, "resp:", response)
                    debugObject?.content.append("resp:" as AnyObject)
                    debugObject?.content.append(response as AnyObject)
                    debugObject?.content.append("-------------End-------------------" as AnyObject)
                    debugEngine?.debugData.append(debugObject)
                } else {
                    DispatchQueue.main.async {
                        let error = GRPCError(errorCode: -10000, errorUserInfo: [NSLocalizedDescriptionKey : "Opps, something is wrong. Please try again later or contact our customer service officer to assist you.".localized() ])
                        failure(error)
                    }
                    let error = GRPCError(errorCode: callResult.statusCode, errorUserInfo: [NSLocalizedDescriptionKey: callResult.statusMessage ?? ""])
                    debugPrint(api, "error:", error)
                    debugObject?.content.append("error: " + "\(error)" as AnyObject)
                    debugObject?.content.append("-------------End-------------------" as AnyObject)
                    debugEngine?.debugData.append(debugObject)
                }
            }
        } catch let error {
            
            DispatchQueue.main.async {
                let error = GRPCError(errorCode: -10000, errorUserInfo: [NSLocalizedDescriptionKey : "Opps, something is wrong. Please try again later or contact our customer service officer to assist you.".localized() ])
                failure(error)
            }
            debugPrint(api, "error:", error)
            debugObject?.content.append("error: " + "\(error)" as AnyObject)
            debugObject?.content.append("-------------End-------------------" as AnyObject)
            debugEngine?.debugData.append(debugObject)
        }
    }
