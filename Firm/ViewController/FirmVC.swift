
import UIKit


class FirmVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let firmService: FirmService = DependencyInjectionContainer.firmService
    
    @IBOutlet weak var tableView: UITableView!
    
    var filteredEmployees: [Employee] { DataContainer.firm.employees.filter { $0.phones != nil && $0.phones?.isEmpty == false }
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
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        if let target = segue.destination as? DetailEmployeeVC {
            target.employee = filteredEmployees[selectedPath.row]
        }
    }
    
    func initFirm() {
        DataContainer.firm = firmService.getFirmData()
        DataContainer.firm.employees = firmService.getEmployees()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(filteredEmployees.count)
        return filteredEmployees.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "goToDetailEmployee", sender: nil)

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let employee = filteredEmployees[indexPath.row]
        
        
        cell.textLabel?.text = "\(employee.id) \(employee.name) \(employee.hiredAt.description) \(employee.getPositionName())\nTelefony:\n \(employee.phonesAsText())"
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        return cell
    }
    
}
