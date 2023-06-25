//
//  TableView.swift
//  DiffableDSTest
//
//  Created by Pavlo Vasylenko on 23.06.2023.
//

import UIKit

open class TableView: UITableView {

    public init(style: UITableView.Style = .plain) {
        super.init(frame: .zero, style: style)

        initialize()
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
        allowsMultipleSelection = true
    }

    func layoutConstraints(in view: UIView) -> [NSLayoutConstraint] {
        [
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ]
    }
}
