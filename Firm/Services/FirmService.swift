
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

    /// Edit employee.
    /// - Parameter employee: Employee's data.
    /// - Returns: True if edited successfully. False if not found.
    func edit(employee: Employee) -> Bool {
        return firmApi.editEmployee(employee)
    }

    func addPhone(newPhone: Phone) {
        return firmApi.addPhone(newPhone: newPhone)
    }
}
