//
//  DataSource.swift
//  DiffableDSTest
//
//  Created by Pavlo Vasylenko on 24.06.2023.
//

import UIKit

final class DataSource: UITableViewDiffableDataSource<Section, SectionItem> {

    init(_ tableView: UITableView) {
        super.init(tableView: tableView) { tableView, indexPath, itemIdentifier in
            let cell = tableView.reuse(CustomCell.self, indexPath)
            cell.selectionStyle = .none
            switch itemIdentifier {
            case .number(let model):
                cell.model = model
            case .letter(let model):
                cell.model = model
            }
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let id = sectionIdentifier(for: section)
        switch id {
        case .numbers:
            return "Pick a number"
        case .letters:
            return "Pick some letters"
        default:
            return nil
        }
    }

    func reload(_ data: [SectionData], animated: Bool = true) {
        var snapshot = snapshot()
        snapshot.deleteAllItems()
        for item in data {
            snapshot.appendSections([item.key])
            snapshot.appendItems(item.values, toSection: item.key)
        }
        apply(snapshot, animatingDifferences: animated)
    }
}
