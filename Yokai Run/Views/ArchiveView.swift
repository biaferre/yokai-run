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
        self.addSubview(buttonsContainer)
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
    
    lazy var buttonsContainer = {
        let stack = UIStackView(arrangedSubviews: [buttonStack, shrineStack])
        stack.axis = .vertical
        stack.spacing = 0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    lazy var shrineStack: UIStackView = {
        var shrines: [UIView] = []

        for skin in UserDefaultsManager.shared.skins {
            let view = UIView()
            view.contentMode = .center
                
            let shrineImg = UIImage(named: "Shrine")
                
            var shrineImgView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: self.frame.width*0.11, height: self.frame.height*0.14))
                
            shrineImgView.image = shrineImg
            shrineImgView.contentMode = .scaleAspectFill
            
            print(shrineImgView.frame.size)
                
            let title = UILabel()
            title.text = skin.isEnabled ? skin.name : "?????"
            title.font = UIFont(name: "hakidame", size: 14)
            
            view.isUserInteractionEnabled = true
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectSkin(_:))))
                
            view.addSubview(shrineImgView)
            view.addSubview(title)
            
            shrines.append(view)
        }
        
        
        let stack = UIStackView(arrangedSubviews: shrines)
        stack.axis = .horizontal
        stack.spacing = 10.0
        stack.alignment = .center
        stack.distribution = .fillEqually
        
        return stack
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
