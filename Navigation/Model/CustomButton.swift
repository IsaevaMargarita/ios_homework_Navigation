//
//  CustomButton.swift
//  Navigation
//
//  Created by Margarita Isaeva on 03.03.2023.
//

import Foundation
import UIKit


class CustomButton: UIButton {
    
    let title: String
    let titleColor: UIColor
    init(title: String, titleColor: UIColor) {
        self.title = title
        self.titleColor = titleColor
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
