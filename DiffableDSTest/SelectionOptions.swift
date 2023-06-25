//
//  SelectionOptions.swift
//  DiffableDSTest
//
//  Created by Pavlo Vasylenko on 24.06.2023.
//

import Foundation

struct SelectionOptions<T: Hashable> {

    var values: [T]
    var selectedValues: [T]
    var multipleSelection: Bool

    init(_ values: [T], selected: [T] = [], multiple: Bool = false) {
        self.values = values
        self.selectedValues = selected
        self.multipleSelection = multiple
    }

    mutating func toggle(_ value: T) {
        guard multipleSelection else {
            selectedValues = [value]
            return
        }
        if selectedValues.contains(value) {
            selectedValues = selectedValues.filter { $0 != value }
        }
        else {
            selectedValues.append(value)
        }
    }
}
