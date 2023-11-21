//
//  ArchiveView.swift
//  Yokai Run
//
//  Created by Bof on 08/11/23.
//

import Foundation
import UIKit

class ArchiveView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
        
        setupViewHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy() {
        self.addSubview(buttonStack)
    }
    
    func setupLayout() {
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonStack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }
    
    lazy var buttonStack: UIStackView = {
        var buttons = [UIButton]()

        for skin in UserDefaultsManager.shared.skins {
            let btn = UIButton()
            btn.addTarget(self, action: #selector(selectSkin), for: .touchDown)
            btn.setTitle(skin.name, for: .normal)
            buttons.append(btn)
        }
        
        
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    @objc func selectSkin(_ sender: UIButton) {
    }
    
    
}
