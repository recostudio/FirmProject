
import UIKit

class AddEmployeeVC: UIViewController {
    
    let firmService: FirmService = DependencyInjectionContainer.firmService
    
    @IBOutlet weak var nameTextInput: UITextField!
    @IBOutlet weak var positionTextInput: UITextField!
    @IBOutlet weak var hireDateTextInput: UITextField!
    @IBOutlet weak var addEmployeeButton: UIButton!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        addEmployeeButton.addTarget(self, action: #selector(addEmployeeButtonPressed), for: .touchUpInside)
    }
    
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        
        toolbar.setItems([doneButton], animated: true)
        hireDateTextInput.inputAccessoryView = toolbar
        hireDateTextInput.inputView = datePicker
    }
    
    @objc func donePressed() {
        hireDateTextInput.text = "\(datePicker.date.ISO8601Format())"
        view.endEditing(true)
    }
    
    @objc func addEmployeeButtonPressed() {
        let hiredAt = (hireDateTextInput.text ?? "").replacingOccurrences(of: " ", with: "")
//        poprawic tworzenie pracownika // pola dynamiczne
        let newEmployee = Employee(
            name: nameTextInput.text ?? "Firstname",
            position: Position(rawValue: Position.MANAGER.rawValue),
            hiredAt: InMemoryFirmApiImplementation.date(dateString: hiredAt),
            phones: [Phone(phoneModel: "LG", imei: "1431r3", addedAt: Date.now, id: "14", assignedTo: nil, assignedAt: Date.now)],
            id: "1"
        )
        
        firmService.addEmployee(newEmployee: newEmployee)
    }
}
