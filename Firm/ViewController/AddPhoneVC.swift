
import UIKit

class AddPhoneVC: UIViewController {
    
    @IBOutlet weak var phoneModelTextInput: UITextField!
    
    @IBOutlet weak var phoneImeiNumberInput: UITextField!
    
    @IBOutlet weak var phoneBoughtDateInput: UITextField!
    
    @IBOutlet weak var phoneAssignedToEmployeeTextInput: UITextField!    
    @IBOutlet weak var assignToEmployeeDateInput: UITextField!
    @IBOutlet weak var addPhoneButton: UIButton!
    
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        addPhoneButton.addTarget(self, action: #selector(addPhoneButtonPressed), for: .touchUpInside)
    }
    
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        
        toolbar.setItems([doneButton], animated: true)
        phoneBoughtDateInput.inputAccessoryView = toolbar
        phoneBoughtDateInput.inputView = datePicker
    }
    
    @objc func donePressed() {
        phoneBoughtDateInput.text = "\(datePicker.date.ISO8601Format())"
        view.endEditing(true)
    }
    
    @objc func addPhoneButtonPressed() {
        let boughtAt = (phoneBoughtDateInput.text ?? "").replacingOccurrences(of: " ", with: "")
        
//        let newPhone: Phone = Phone(phoneModel: <#T##String#>, imei: <#T##String#>, addedAt: <#T##Date#>, id: <#T##String#>, assignedTo: <#T##Employee?#>, assignedAt: <#T##Date?#>)

//        firmService.addPhone(newPhone: newPhone)
    }
}
