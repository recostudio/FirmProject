
import Foundation

protocol FirmApi {
    
    func getEmployees() -> [Employee]
    
    func getFirmData() -> Firm
    
    func addEmployee(newEmployee: Employee)

    func editEmployee(_ employee: Employee) -> Bool
    
    func addPhone(newPhone: Phone)
}
