//
//  MinimalButtonComponent.swift
//  Yokai Run
//
//  Created by Bof on 13/11/23.
//

import Foundation
import UIKit

class MinimalButtonComponent: UIButton {
    var button: UIButton

    override var intrinsicContentSize: CGSize {
           get {
               let baseSize = super.intrinsicContentSize
               return CGSize(width: baseSize.width + 20,
                             height: baseSize.height)
               }
        }
    
    init(text: String, img: String){
        let button = UIButton()
        
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont(name: "NeoTech", size: 12)
        
        button.setImage(UIImage(named: img), for: .normal)
        button.tintColor = .white
        
        self.button = button
        
        super.init(frame: .zero)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
