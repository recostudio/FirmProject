
import UIKit

class PhoneVC: UIViewController {
    
    var firmInformation: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 0, y: 60, width: UIScreen.main.bounds.width, height: 50))
        lbl.text = "Phones"
        lbl.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.medium)
        lbl.textColor = UIColor.darkGray
        lbl.textAlignment = NSTextAlignment.center
        return lbl
    }()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(firmInformation)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PhoneVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped phone cell")
    }
}

extension PhoneVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
