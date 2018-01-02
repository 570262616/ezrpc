
    /// {{ method|methodDescriptorName }} (Unary)
    public static func {{ method|methodDescriptorName }}(request: {{ method|input }}, completion: @escaping ({{ .method|output }}) -> Void, failure: @escaping (Error) -> Void) {

        guard let grpcEngine = grpcEngine else { return }

        let api = "{{ .|path:file,service,method }}"
        
        debugEngine?.debugData.append("-------------Start-------------------" as AnyObject)
        debugEngine?.debugData.append("api: " + "\(api)" as AnyObject)
        debugEngine?.debugData.append("metadata: \n" + grpcEngine.grpcClient.metadata.description as AnyObject)

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
            debugEngine?.debugData.append("req: " as AnyObject)
            debugEngine?.debugData.append(request as AnyObject)
            
            try call.ezPerform(message: requestData, metadata: requestMetadata) { (callResult) in
                
                if let responseData = callResult.resultData, let response = try? {{ method|output }}(serializedData:responseData) {
                    DispatchQueue.main.async {
                        completion(response)
                    }
                    debugPrint(api, "resp:", response)
                    debugEngine?.debugData.append("resp:" as AnyObject)
                    debugEngine?.debugData.append(response as AnyObject)
                    debugEngine?.debugData.append("-------------End-------------------" as AnyObject)
                } else {
                    let error = GRPCError(errorCode: callResult.statusCode, errorUserInfo: [NSLocalizedDescriptionKey: callResult.statusMessage ?? ""])
                    DispatchQueue.main.async {
                        failure(error)
                    }
                    debugPrint(api, "error:", error)
                    debugEngine?.debugData.append("error: " + "\(error)" as AnyObject)
                    debugEngine?.debugData.append("-------------End-------------------" as AnyObject)
                }
            }
        } catch let error {
            DispatchQueue.main.async {
                failure(error)
            }
            debugPrint(api, "error:", error)
            debugEngine?.debugData.append("error: " + "\(error)" as AnyObject)
            debugEngine?.debugData.append("-------------End-------------------" as AnyObject)
        }
    }
