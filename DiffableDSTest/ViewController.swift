//
//  ViewController.swift
//  DiffableDSTest
//
//  Created by Pavlo Vasylenko on 18.06.2023.
//

import UIKit

class ViewController: UIViewController {

    var tableView: TableView
    var dataSource: DataSource

    var singleOptions = SelectionOptions<NumberOption>(NumberOption.allCases, selected: [.two])
    var multipleOptions = SelectionOptions<LetterOption>(LetterOption.allCases, selected: [.a, .c], multiple: true)


    required init?(coder: NSCoder) {
        self.tableView = TableView(style: .insetGrouped)
        self.dataSource = DataSource(tableView)

        super.init(coder: coder)
    }

    override func loadView() {
        super.loadView()

        view.addSubview(tableView)

        NSLayoutConstraint.activate(tableView.layoutConstraints(in: view))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Table view"
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.register(CustomCell.self)
        tableView.delegate = self

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        reload()
    }

    func reload() {
        dataSource.reload([
            .init(key: .numbers, values: NumberOption.allCases.map { .number($0) }),
            .init(key: .letters, values: LetterOption.allCases.map { .letter($0) }),
        ])
    }

}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sectionId = dataSource.sectionIdentifier(for: indexPath.section) else {
                    return
                }

                switch sectionId {
                case .numbers:
                    guard case let .number(model) = dataSource.itemIdentifier(for: indexPath) else {
                        return
                    }
                    tableView.deselectAllInSection(except: indexPath)
                    singleOptions.toggle(model)
                    print(singleOptions.selectedValues)

                case .letters:
                    guard case let .letter(model) = dataSource.itemIdentifier(for: indexPath) else {
                        return
                    }
                    multipleOptions.toggle(model)
                    print(multipleOptions.selectedValues)
                }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let sectionId = dataSource.sectionIdentifier(for: indexPath.section) else {
            return
        }
        switch sectionId {
        case .numbers:
            tableView.select([indexPath])
        case .letters:
            guard case let .letter(model) = dataSource.itemIdentifier(for: indexPath) else {
                return
            }
            multipleOptions.toggle(model)
            print(multipleOptions.selectedValues)
        }
    }
}

