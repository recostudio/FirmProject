
import UIKit
import Darwin

struct Firm {
    let name: String
    let adress: String
    var employees: [Employee]
    var phones: [Phone]?
    var position: Position
    
    mutating func hireEmployee(employee: Employee) {
        employees.append(employee)
    }
    
    mutating func fireEmployee(employeeId: String)  {
        employees = employees.filter {$0.id != employeeId}
    }
    
    mutating func addPhones(phone: Phone){
        phones?.append(phone)
    }
    
    mutating func removePhone(phoneId: String) {
        phones = phones?.filter {$0.id != phoneId}
    }
}

