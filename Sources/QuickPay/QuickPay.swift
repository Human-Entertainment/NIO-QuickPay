import AsyncHTTPClient
import NIO

public class QuickPay {
    let apiKey: String
    
    let httpClient = HTTPClient(eventLoopGroupProvider: .createNew)
    
    private func request(url path: String) -> HTTPClient.Request {
        var request = HTTPClient.Request(url: "https://api.quickpay.net/"+(path),
                                         method: .GET)
            request.headers.add(name: "Authorization",
                                value: "Basic \((":"+apiKey).toBase64())")
            request.headers.add(name: "Accept-Version",
                                value: "v10")
            request.headers.add(name: "Accept",
                                value: "application/json")
        
        return request
    }
    /**
     * - Parameters:
     *   - apiKey: The API key you got from QuickPay
     */
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    deinit {
        try! httpClient.syncShutdown()
    }
    
    /// Quick pinging system, to test the API key.
    public func ping() -> EventLoopFuture<Bool> {
        httpClient.execute(request: request(url: "ping"))
            .map { response -> Bool in
                switch(response.status) {
                case .ok:
                    return true
                default:
                    print(response.status)
                    return false
                }
        }
    }
    
    public func getPaymentLink(currency: Currency, pice: Int) {
        httpClient.execute(request: <#T##HTTPClient.Request#>)
    }
}
