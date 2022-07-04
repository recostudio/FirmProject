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

class EmployeeEditVC: UIViewController, PositionSelectionDelegate {

    // MARK: - Dependencies

    let firmService: FirmService = DependencyInjectionContainer.firmService
    var delegate: EmployeeEditDelegate?
    var employee: Employee!

    // MARK: - Subviews

    @IBOutlet weak var nameTextInput: UITextField!
    @IBOutlet weak var positionSelectionButton: UIButton!
    @IBOutlet weak var hireDatePicker: UIDatePicker!
    @IBOutlet weak var phonesTextInput: UITextField!

    // MARK: - Properties

    // ...

    // MARK: - UIViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()
        createDoneNavigationItem()
        loadDataToUI()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination as? PositionSelectionVC {
            target.selected = employee.position
            target.delegate = self
        }
    }

    // MARK: - EmployeeEditVC methods

    func createDoneNavigationItem() {
        let item = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        self.navigationItem.rightBarButtonItem = item
    }

    func loadDataToUI() {
        // Name
        nameTextInput.text = employee.name

        // Position
        self.updatePositionSelectionButton()

        // Hire date
        hireDatePicker.timeZone = TimeZone(identifier: "Europe/Warsaw")
        hireDatePicker.date = employee.hiredAt

        // Phones
        phonesTextInput.text = nil
    }

    private func updatePositionSelectionButton() {
        let position = employee.position
        positionSelectionButton.setTitle(position?.rawValue ?? "Select...", for: .normal)
    }

    private func validate() -> Bool {
        guard !self.employee.name.isEmpty else {
            return false
        }

        guard self.employee.position != nil else {
            return false
        }

        return true
    }

    // MARK: - PositionSelectionDelegate methods

    func positionSelection(_ vc: PositionSelectionVC, selectedPosition position: Position) {
        self.employee.position = position
        self.updatePositionSelectionButton()
    }

    // MARK: - Actions

    @IBAction func nameEdited(_ textField: UITextField) {
        self.employee.name = textField.text ?? ""
    }

    @IBAction func hireDateValueChanged(_ picker: UIDatePicker) {
        self.employee.hiredAt = picker.date
    }

    @objc func donePressed(_ item: UIBarButtonItem) {
        // Hide keyboard is a good start here
        view.endEditing(true)

        // Check validity of data
        if validate() {

            if self.employee.id != nil {
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
