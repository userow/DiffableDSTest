//
//  Enums.swift
//  DiffableDSTest
//
//  Created by Pavlo Vasylenko on 24.06.2023.
//

enum NumberOption: String, CaseIterable {
    case one
    case two
    case three
}

extension NumberOption: CustomCellModel {

    var text: String { rawValue }
}

enum LetterOption: String, CaseIterable {
    case a
    case b
    case c
    case d
}

extension LetterOption: CustomCellModel {

    var text: String { rawValue }
}

enum Section: Hashable {
    case numbers
    case letters
}

enum SectionItem: Hashable {
    case number(NumberOption)
    case letter(LetterOption)
}

struct SectionData {
    var key: Section
    var values: [SectionItem]
}
