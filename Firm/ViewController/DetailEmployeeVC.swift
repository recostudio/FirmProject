
import UIKit

class DetailEmployeeVC: UIViewController {

    @IBOutlet weak var positionTextField: UITextField!
    
    @IBOutlet weak var employeeNameTextField: UITextField!
    
    @IBOutlet weak var hireDateTextField: UITextField!
    
    @IBOutlet weak var phonesTextField: UITextField!
    
    @IBAction func doneSave(_ sender: UIButton) {
//        1. przekazanie informacji o zmienionym name do Employee
        employee!.name = employeeNameTextField.text!
        
    }
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
   
    func loadData() {
        guard let position = employee?.position else {
            print("No position")
            return
        }
        
        guard let hireDate = employee?.hiredAt else {
            print("No date")
            return
        }

//        guard let phones = employee?.phones else {
//            print("No phones")
//        }
        employeeNameTextField.text = employee?.name
        positionTextField.text = position.name
        hireDateTextField.text = "\(hireDate.ISO8601Format())"
        phonesTextField.text = fromPhoneArrayToString()

    }
    
    func fromPhoneArrayToString() -> String {
        
        var phonesString = ""
        
        for phone in employee!.phones! {
            phonesString += " " + phone.phoneModel
        }
        
        return phonesString
    }
}
