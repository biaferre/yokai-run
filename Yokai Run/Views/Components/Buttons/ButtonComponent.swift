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
    var action: () -> ()

    override var intrinsicContentSize: CGSize {
           get {
               let baseSize = super.intrinsicContentSize
               return CGSize(width: baseSize.width + 20,
                             height: baseSize.height)
               }
        }
    
    init(type: ButtonScale, title: String, action: @escaping ()->()) {
        self.type = type
        self.title = title
        self.action = action
        super.init(frame: .zero)
        
        self.backgroundColor = .systemPink
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadButton() -> UIButton {
        var button = UIButton(type: .roundedRect)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.setTitle(title, for: .normal)
        button.tintColor = .black
        button.backgroundColor = .systemRed
        
        return button
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        action()
    }
}
