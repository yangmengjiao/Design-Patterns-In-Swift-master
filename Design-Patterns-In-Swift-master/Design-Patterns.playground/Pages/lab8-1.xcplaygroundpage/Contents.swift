
//develop with swift language
import Foundation

struct Agent{
    var agentId: String
    var agentName: String
}

class Call{
    var requestId: String
    var agent: String
    init(id: String,agent: String) {
        self.requestId = id
        self.agent = "agent"
    }
    
    func callPop(agent: Agent) {
        self.agent = agent.agentName
        let now = Date()
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let timeStamp = String(timeInterval)
        self.requestId = timeStamp
    }
}

struct Customer {
    var customerID: String
    var customerName: String
}

struct Request {
    var reqId: String
    var requester: Customer
    var agent: Agent
    var reqContent: String
    var respContent: String
    var isAnswered: Bool
    var isSaleLead: Bool
}

protocol RequestBuilder {
    func buildCallPop()
    func buildCustomer(phoneNumber: String)
    func buildRequestContent(requstContent: String)
    func buildResponseContent(respContent: String)
    func buildConsultation()
    func buildCloseInformation()
    func getRequest() -> Request
}

class RequestBuilderImpl: RequestBuilder {
    private var request: Request
    init(request: Request) {
        self.request = request
    }
    
    func buildCallPop() {
        let now = Date()
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        let timeStamp = String(timeInterval)
        let agent = Agent(agentId: timeStamp, agentName: "namE\(timeStamp)")
        let calltop = Call(id: agent.agentId, agent: "agent")
        calltop.callPop(agent: agent)
        request.agent = agent
        request.reqId = calltop.requestId
        
    }
    
    func buildCustomer(phoneNumber: String) {
        let customer = Customer(customerID: phoneNumber, customerName: "name\(phoneNumber)")
        request.requester = customer
    }
    
    func buildRequestContent(requstContent: String) {
        request.reqContent = requstContent
    }
    
    func buildResponseContent(respContent: String) {
        request.respContent = respContent
    }
    
    func buildConsultation() {
        request.isSaleLead = false
    }
    
    func buildCloseInformation() {
        request.isAnswered = false
    }
    
    func getRequest() -> Request {
        return request
    }
    
    
}

struct RequestRepresentative {
    var reqBuilder: RequestBuilder
    var phoneNumber: String
    var reqContent: String
    var respContent: String
    
    func constructRequest() {
        reqBuilder.buildCallPop();
        reqBuilder.buildCustomer(phoneNumber: phoneNumber)
        reqBuilder.buildResponseContent(respContent: respContent)
        reqBuilder.buildRequestContent(requstContent: reqContent)
        reqBuilder.buildConsultation()
        reqBuilder.buildCloseInformation()
        
    }
    
    func getRequest() -> Request {
        return reqBuilder.getRequest()
    }
}















//: [Next](@next)
