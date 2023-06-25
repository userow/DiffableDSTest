//
//  CustomCellModel.swift
//  DiffableDSTest
//
//  Created by Pavlo Vasylenko on 24.06.2023.
//

import Foundation

protocol CustomCellModel {
    var text: String { get }
    var secondaryText: String? { get }
}

extension CustomCellModel {
    var secondaryText: String? { nil }
}
