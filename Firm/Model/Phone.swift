
import UIKit

struct Phone {
    var phoneModel: String
    var imei: String
    var addedAt: Date
    var id: String
    var assignedTo: Employee?
    var assignedAt: Date?
    
    func getAssignedAtAsText() -> String {
        if let unwrappedAssignedAt = assignedAt {
            return unwrappedAssignedAt.description
        } else {
            return "Brak daty przypisania"
        }
    }
}
