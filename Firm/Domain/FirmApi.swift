
import Foundation

protocol FirmApi {
    
    func getEmployees() -> [Employee]
    
    func getFirmData() -> Firm
    
    func addEmployee(newEmployee: Employee)
    
    func addPhone(newPhone: Phone)
}
