//
//  MainButtonComponent.swift
//  Yokai Run
//
//  Created by Bof on 07/11/23.
//

import Foundation
import UIKit

class MainButtonComponent: UIButton {
    var type: ButtonScale
    var title: String
    var button: UIButton

    override var intrinsicContentSize: CGSize {
        get {
            let baseSize = super.intrinsicContentSize
            return CGSize(width: baseSize.width + 20,
                          height: baseSize.height)
        }
    }

    init(type: ButtonScale, title: String) {
        self.type = type
        self.title = title
        self.button = UIButton(type: .roundedRect)

        super.init(frame: .zero)

        setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupButton() {
        var configuration = UIButton.Configuration.tinted()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 24, bottom: 4, trailing: 24)
        configuration.attributedTitle = AttributedString(title, attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: "NeoTech", size: 20)!]))
        
        button.configuration = configuration
        
        button.tintColor = type == .primary ? .black : .systemRed
        button.backgroundColor = type == .primary ? .systemRed : .black

        sizeToFit()

        addSubview(button)
    }
}
