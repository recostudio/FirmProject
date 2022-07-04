
import UIKit

struct Employee {
    
    var name: String
    var position: Position!
    var hiredAt: Date
    var phones: [Phone]?
    var id: String?

    mutating func addPhone(phone: Phone) {
        phones?.append(phone)
        
    }
    
    mutating func removePhone(phoneId: String) {
        phones = phones?.filter{$0.id != phoneId }
        
    }
    
//    func getPositionName() -> String {
//        if let unwrappedPosition = position {
//            return unwrappedPosition.name
//        } else {
//            return "Brak stanowiska"
//        }
//    }
    func getPositionName() -> String {
        guard let unwrappedPosition = position?.rawValue
        else  {
            return "Brak stanowiska"
        }
        
        return unwrappedPosition
    }
    func phonesAsText() -> String {
        var phonesText: String = ""
        phones?
            .sorted { $0.assignedAt! < $1.assignedAt!}
            .forEach { phone in
                phonesText += "\(phone.id) \(phone.phoneModel) \(phone.getAssignedAtAsText())\n"
            }
        return phonesText
    }
}


