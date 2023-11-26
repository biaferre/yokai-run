//
//  ArchiveView.swift
//  Yokai Run
//
//  Created by Bof on 08/11/23.
//

import Foundation
import UIKit

class ArchiveView: UIView {
    
    let userDefaults = UserDefaultsManager.shared.userDefaults
            
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        
        setupViewHierarchy()
        setupLayout()
        
        print(UserDefaultsManager.shared.skins[1].isEnabled)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy() {
        self.addSubview(buttonStack)
        self.addSubview(uncollectedModel)
    }
    
    func setupLayout() {
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonStack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        uncollectedModel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uncollectedModel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            uncollectedModel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            uncollectedModel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
            uncollectedModel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)

        ])
        
    }
    
    lazy var shrineStack: UIStackView = {
        
    }()
    
    lazy var buttonStack: UIStackView = {
        var buttons = [UIButton]()

        for skin in UserDefaultsManager.shared.skins {
            let btn = UIButton()
            let btnImg = UIImage(named: skin.isEnabled ? "\(skin.imgNamed)-Logo" : "\(skin.imgNamed)-Logo-Hidden")
            btn.setImage(btnImg, for: .normal)
            btn.addTarget(self, action: #selector(selectSkin(_:)), for: .touchDown)
            buttons.append(btn)
        }
        
        
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    lazy var uncollectedModel: UIImageView = {
        let image = UIImage(named: "Uncollected-Modal")
        var imageView = UIImageView(image: image)
        imageView.isHidden = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(toggleModelVisibility))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        return imageView
    }()
    
    
}


// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct View_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ArchiveView().showPreview().previewDevice("iPhone 14 Pro").previewInterfaceOrientation(.landscapeRight)
        }
    }
}
#endif
