//
//  EmployeeEditVC.swift
//  Firm
//
//  Created by Ariel Bogdziewicz on 04/07/2022.
//

import UIKit

protocol EmployeeEditDelegate: AnyObject {
    func employeeEditDone(_ vc: EmployeeEditVC)
}

class EmployeeEditVC: UIViewController {

    // MARK: - Dependencies

    let firmService: FirmService = DependencyInjectionContainer.firmService
    var delegate: EmployeeEditDelegate?
    var employee: Employee?

    // MARK: - Subviews

    @IBOutlet weak var nameTextInput: UITextField!
    @IBOutlet weak var positionTextInput: UITextField!
    @IBOutlet weak var hireDatePicker: UIDatePicker!
    @IBOutlet weak var phonesTextInput: UITextField!

    // MARK: - Properties

    // ...

    // MARK: - UIViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()
        createDoneNavigationItem()
        loadData()
    }

    // MARK: - EmployeeEditVC methods

    func createDoneNavigationItem() {
        let item = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        self.navigationItem.rightBarButtonItem = item
    }

    func loadData() {
        nameTextInput.text = employee?.name
        positionTextInput.text = nil
        hireDatePicker.timeZone = TimeZone(identifier: "Europe/Warsaw")
        hireDatePicker.date = employee?.hiredAt ?? .now
        phonesTextInput.text = nil
    }

    private func validate() -> Bool {
        guard let name = nameTextInput.text, !name.isEmpty else {
            return false
        }

        return true
    }

    // MARK: - Actions

    @objc func donePressed(_ item: UIBarButtonItem) {
        // Hide keyboard is a good start here
        view.endEditing(true)

        // Check validity of data
        if validate() {

            // Create new employee
            let employee = Employee(
                name: nameTextInput.text!,
                position: .INTERN,
                hiredAt: hireDatePicker.date,
                phones: nil,
                id: self.employee?.id ?? UUID().uuidString)

            if self.employee != nil {
                if !self.firmService.edit(employee: employee) {
                    // Display alert about non existing employee
                    let alert = UIAlertController(title: nil, message: "Non existing employee", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                    self.present(alert, animated: true)
                }
            } else {
                self.firmService.addEmployee(newEmployee: employee)
            }

            // Go back to previous view controller
            self.navigationController?.popViewController(animated: true)
            // Notify previous controller about change
            self.delegate?.employeeEditDone(self)

        } else {

            // Display alert about invalid data
            let alert = UIAlertController(title: nil, message: "Invalid data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            self.present(alert, animated: true)
        }
    }
}
