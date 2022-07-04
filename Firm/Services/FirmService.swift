
import Foundation

class FirmService {
    
    let firmApi: FirmApi = InMemoryFirmApiImplementation()
    
    func getEmployees() -> [Employee] {
        return firmApi.getEmployees()
    }
    
    func getFirmData() -> Firm {
        return firmApi.getFirmData()
    }
    
    func addEmployee(newEmployee: Employee) {
        return firmApi.addEmployee(newEmployee: newEmployee)
    }
    
    func addPhone(newPhone: Phone) {
        return firmApi.addPhone(newPhone: newPhone)
    }
    
}

