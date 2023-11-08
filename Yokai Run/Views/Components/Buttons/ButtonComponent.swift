//
//  ButtonComponent.swift
//  Yokai Run
//
//  Created by Bof on 07/11/23.
//

import Foundation
import UIKit

class ButtonComponent: UIButton {
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
        self.button = UIButton(type: .roundedRect) // Inicialize 'self.button' aqui
        super.init(frame: .zero)
        
        self.button.setTitle(title, for: .normal)
        self.button.tintColor = .black
        self.button.backgroundColor = .systemRed

        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
