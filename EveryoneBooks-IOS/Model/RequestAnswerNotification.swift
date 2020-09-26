import Foundation

struct RequestAnswerNotification {
    var fromId: String?;
    var notificationType: String?;
    var date: String?;
    var from: String?;
    var fromName: String?;
    var answer: Bool?;
    var id: String?;
    
    init(dic: [String: Any]) {
        fromId = dic["fromId"] as? String;
        notificationType = dic["notificationType"] as? String;
        date = dic["date"] as? String;
        from = dic["type"] as? String;
        fromName = dic["fromString"] as? String;
        answer = dic["answer"] as? Bool;
        id = dic["_id"] as? String;
    }
}
