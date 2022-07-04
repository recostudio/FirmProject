//
//  PositionSelectionVC.swift
//  Firm
//
//  Created by Ariel Bogdziewicz on 04/07/2022.
//

import UIKit

protocol PositionSelectionDelegate: AnyObject {
    func positionSelection(_ vc: PositionSelectionVC, selectedPosition position: Position)
}

class PositionSelectionVC: UITableViewController {

    // MARK: - Dependencies

    weak var delegate: PositionSelectionDelegate?
    var selected: Position?

    // MARK: - Properties

    let allPositions: [Position] = [
        .INTERN,
        .JUNIOR_DEVELOPER,
        .SENIOR_DEVELOPER,
        .MANAGER,
        .CEO
    ]

    // MARK: - Cell updates

    private func updateAllVisibleCells() {
        for indexPath in self.tableView.indexPathsForVisibleRows ?? [] {
            if let cell = tableView.cellForRow(at: indexPath) {
                self.update(cell: cell, indexPath: indexPath)
            }
        }
    }

    private func update(cell: UITableViewCell, indexPath: IndexPath) {
        let position = allPositions[indexPath.row]
        cell.selectionStyle = .gray
        cell.textLabel?.text = position.rawValue
        cell.accessoryType = self.selected == position ? .checkmark : .none
    }

    // MARK: - UITableViewDataSource methods

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "positionCell")!
        self.update(cell: cell, indexPath: indexPath)
        return cell
    }

    // MARK: - UITableViewDelegate methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allPositions.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect cell
        tableView.deselectRow(at: indexPath, animated: true)

        // Update model in this controller
        let position = allPositions[indexPath.row]
        self.selected = position
        self.updateAllVisibleCells()

        // Notify delegate (previous controller)
        self.delegate?.positionSelection(self, selectedPosition: position)

        // Go back to previous controller
        self.navigationController?.popViewController(animated: true)
    }
}
