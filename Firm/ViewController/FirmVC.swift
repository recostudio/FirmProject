
import UIKit


class FirmVC: UIViewController, UITableViewDelegate, UITableViewDataSource, EmployeeEditDelegate {
    
    let firmService: FirmService = DependencyInjectionContainer.firmService
    
    @IBOutlet weak var tableView: UITableView!
    
//    var filteredEmployees: [Employee] { DataContainer.firm.employees.filter { $0.phones != nil && $0.phones?.isEmpty == false }
//    }

    var filteredEmployees: [Employee] {
        DataContainer.firm.employees
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initFirm()
        //        firmInformation.text = DataContainer.firm.name + " " + DataContainer.firm.adress
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        view.addSubview(firmInformation)
        tableView.delegate = self
        tableView.dataSource = self
     
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? EmployeeEditVC {
            target.delegate = self

            if let selectedIndexPath = self.tableView.indexPathForSelectedRow, segue.identifier == "editEmployee" {
                target.title = "Edit employee"
                target.employee = filteredEmployees[selectedIndexPath.row]
            } else {
                target.title = "Add employee"
            }

        } else if let target = segue.destination as? AddPhoneVC {
            // TODO: Implement...
        }
    }

    func initFirm() {
        DataContainer.firm = firmService.getFirmData()
        DataContainer.firm.employees = firmService.getEmployees()
    }

    // MARK: - UITableViewDataSource methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(filteredEmployees.count)
        return filteredEmployees.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let employee = filteredEmployees[indexPath.row]
        
        
        cell.textLabel?.text = "\(employee.id) \(employee.name) \(employee.hiredAt.description) \(employee.getPositionName())\nTelefony:\n \(employee.phonesAsText())"
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        return cell
    }

    // MARK: - EmployeeEditDelegate methods

    func employeeEditDone(_ vc: EmployeeEditVC) {
        self.tableView.reloadData()
    }
}
