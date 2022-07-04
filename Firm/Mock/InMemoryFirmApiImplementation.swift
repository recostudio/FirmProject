
import Foundation

class InMemoryFirmApiImplementation: FirmApi {
    
    var employees: [Employee] =
    [
        Employee(
            name: "Janusz",
            position: .MANAGER,
            hiredAt: date(dateString: "2017-04-14T10:44:00+0000"),
            phones: [
                Phone(
                    phoneModel: "Iphone 13",
                    imei: "1342352",
                    addedAt: InMemoryFirmApiImplementation.date(dateString: "2018-05-14T10:44:00+0000"),
                    id: "a",
                    assignedAt: InMemoryFirmApiImplementation.date(dateString: "2019-05-14T10:44:00+0000"))
            ],
            id: "1"
        ),
        Employee(
            name: "Mariusz",
            position: nil,
            hiredAt: InMemoryFirmApiImplementation.date(dateString: "2016-04-14T10:44:00+0000"),
            phones: [],
            id: "2"
        ),
        Employee(
            name: "Andrzej",
            position: nil,
            hiredAt: InMemoryFirmApiImplementation.date(dateString: "2018-04-14T10:44:00+0000"),
            phones: [
                Phone(
                    phoneModel: "Samsung galaxy s21",
                    imei: "1342352",
                    addedAt: InMemoryFirmApiImplementation.date(dateString: "2020-05-14T10:44:00+0000"),
                    id: "b",
                    assignedAt: InMemoryFirmApiImplementation.date(dateString: "2021-05-14T10:44:00+0000")
                ),
                Phone(
                    phoneModel: "Huawei P40",
                    imei: "112352",
                    addedAt: InMemoryFirmApiImplementation.date(dateString: "2019-05-14T10:44:00+0000"),
                    id: "c",
                    assignedAt: InMemoryFirmApiImplementation.date(dateString: "2020-03-14T10:44:00+0000"))
            ],
            id: "3"
        ),
        Employee(
            name: "Stefan Jarząbek",
            position: .INTERN,
            hiredAt: InMemoryFirmApiImplementation.date(dateString: "2022-04-14T10:44:00+0000"),
            phones: [
                Phone(
                    phoneModel: "Iphone 12",
                    imei: "134213152",
                    addedAt: InMemoryFirmApiImplementation.date(dateString: "2018-05-14T10:44:00+0000"),
                    id: "a",
                    assignedAt: InMemoryFirmApiImplementation.date(dateString: "2019-05-14T10:44:00+0000"))
            ],
            id: "1"
        )
    ]
    
    var phones: [Phone] =
    []

    func getEmployees() -> [Employee] {
        return employees
    }
    
    func getFirmData() -> Firm {
        return Firm(name: "Firm Sp. z.o.o", adress: "Sikorskiego 97 Warszawa", employees: [], position: Position.MANAGER)
    }
    
    func addEmployee(newEmployee: Employee) {
        employees.append(newEmployee)
    }

    func editEmployee(_ employee: Employee) -> Bool {
        guard !employee.id.isEmpty else {
            return false
        }
        guard let index = employees.firstIndex(where: { $0.id == employee.id }) else {
            return false
        }
        employees[index] = employee
        return true
    }

    func addPhone(newPhone: Phone) {
        phones.append(newPhone)
    }
    
    static func date(dateString: String) -> Date {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from:dateString)!
    }
    
}
