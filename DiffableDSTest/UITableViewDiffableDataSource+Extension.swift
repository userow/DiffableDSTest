//
//  UITableViewDiffableDataSource+Extension.swift
//  DiffableDSTest
//
//  Created by Pavlo Vasylenko on 24.06.2023.
//

import Foundation

import UIKit

extension UITableViewDiffableDataSource {

    func selectedIndexPaths<T: Hashable>(_ selection: SelectionOptions<T>,
                                         _ transform: (T) -> ItemIdentifierType) ->  [IndexPath] {
        selection.values
            .filter { selection.selectedValues.contains($0) }
            .map { transform($0) }
            .compactMap { indexPath(for: $0) }
    }
}
