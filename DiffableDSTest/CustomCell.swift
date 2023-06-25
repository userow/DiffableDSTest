//
//  CustomCell.swift
//  DiffableDSTest
//
//  Created by Pavlo Vasylenko on 24.06.2023.
//

import UIKit

class CustomCell: UITableViewCell {

    var model: CustomCellModel?

    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)

        var contentConfig = defaultContentConfiguration().updated(for: state)
        contentConfig.text = model?.text
        contentConfig.secondaryText = model?.secondaryText

        contentConfig.imageProperties.tintColor = .systemBlue
        contentConfig.image = UIImage(systemName: "circle")

        if state.isHighlighted || state.isSelected {
            contentConfig.image = UIImage(systemName: "checkmark.circle.fill")
        }
        contentConfiguration = contentConfig
    }
}
