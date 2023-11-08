//
//  MenuView.swift
//  Yokai Run
//
//  Created by Bof on 07/11/23.
//

import Foundation
import UIKit

class MenuView: UIView {
    weak var delegate: MenuViewDelegate?

    // --MARK: initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // --MARK: setup functions
    func setupViewHierarchy(){
        self.addSubview(contentStack)
    }
    
    func setupViewAttributes(){
        
    }
    
    func setupLayout(){
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentStack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    
    
    // --MARK: title

    lazy var title: UILabel = {
        var label = UILabel()
        label.text = "Yokai Run"
        label.textColor = .red
        label.font = UIFont(name: "SF Pro", size: 100)
        
        return label
    }()
    
    
    
    // --MARK: buttons
    lazy var startButton: UIButton = {
        
        var button = ButtonComponent(type: .primary, title: "Start").button
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button

    }()
    
    lazy var archiveButton: UIButton = {
        
        var button = ButtonComponent(type: .primary, title: "Archive").button
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
        
    }()
    
    lazy var creditsButton: UIButton = {
        
        var button = ButtonComponent(type: .primary, title: "Credits").button
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
        
    }()
    
    
    
    // --MARK: button action
    @objc func buttonAction(sender: UIButton!) {
        delegate?.navigate(to: (sender.titleLabel?.text)!)
    }
    
    
    
    // --MARK: main stacks and containers
    lazy var buttonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [startButton, archiveButton, creditsButton])
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    lazy var contentStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [title, buttonStack])
        
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .center
        stack.distribution = .equalCentering
        
        return stack
    }()
    
}
