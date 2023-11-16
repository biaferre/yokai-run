//
//  MenuView.swift
//  Yokai Run
//
//  Created by Bof on 07/11/23.
//

import Foundation
import UIKit

class MenuView: UIView {
    weak var delegate: NavigationDelegate?

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
        titleBanner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleBanner.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3, constant: 0),
            titleBanner.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.55, constant: 0)
        ])
        
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentStack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    
    
    // --MARK: title

    lazy var titleBanner: UIImageView = {
        let img = UIImage(named: "TitleBanner")!
        let imgView = UIImageView(image: img)
        imgView.contentMode = .scaleToFill
        return imgView
    }()
    
    
    // --MARK: buttons
    lazy var startButton: UIButton = {
        var button = MainButtonComponent(type: .primary, title: "Start").button
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button

    }()
    
    lazy var archiveButton: UIButton = {
        var button = MainButtonComponent(type: .primary, title: "Archive").button
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
        
    }()
    
    lazy var onboardingButton: UIButton = {
        var button = MainButtonComponent(type: .primary, title: "How to Play").button
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
        
    }()
    
    
    
    // --MARK: button action
    @objc func buttonAction(sender: UIButton!) {
        delegate?.navigate(to: (sender.titleLabel?.text)!)
    }
    
    
    
    // --MARK: main stacks and containers
    lazy var buttonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [startButton, archiveButton, onboardingButton])
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    lazy var contentStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [titleBanner, buttonStack])
        
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .center
        stack.distribution = .equalCentering
        
        return stack
    }()
    
}
