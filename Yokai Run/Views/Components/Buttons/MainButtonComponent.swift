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
                
        self.button.setTitle(title, for: .normal)
        self.button.titleLabel?.font = UIFont(name: "Neo-Tech", size: 36)
        
        self.button.tintColor = type == .primary ? .black : .systemRed
        self.button.backgroundColor = type == .primary ? .systemRed : .black

        super.init(frame: .zero)

        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
