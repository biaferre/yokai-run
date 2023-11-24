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
        self.backgroundColor = .black
        
        setupViewHierarchy()
        setupViewAttributes()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // --MARK: setup functions
    func setupViewHierarchy(){
        self.addSubview(background)
        self.addSubview(contentStack)
    }
    
    func setupViewAttributes(){
        
    }
    
    func setupLayout(){
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            background.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            background.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            background.widthAnchor.constraint(equalTo: self.widthAnchor),
            background.heightAnchor.constraint(equalTo: self.heightAnchor)


        ])
        
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentStack.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    
    
    // --MARK: title

    lazy var titleBanner: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Yokai Run"
        label.font = UIFont(name: "BatesShower", size: 64)
        label.textColor = .systemRed
        label.sizeToFit()
        label.shadowColor = .black
        
        return label
    }()
    
    //        button.titleLabel?.font = UIFont(name: "NeoTech", size: 12)

    
    
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
        let title = (sender.titleLabel?.text)!
        animateBackground(sender: title)
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
        stack.spacing = 56.0
        stack.alignment = .center
        stack.distribution = .fillEqually
        
        
        
        return stack
    }()
    
    // --MARK: background
    
    func fadeInOut(in fadeIn: Bool) {
        if fadeIn {
            self.contentStack.layer.opacity = 1.0
        }
        else {
            self.contentStack.layer.opacity = 0.0
        }
    }
    
    lazy var background: UIStackView = {
        var bgView = UIStackView(arrangedSubviews: [leftShoji,rightShoji] )
        bgView.alignment = .center
        bgView.axis = .horizontal
        bgView.distribution = .fillEqually
        return bgView
    }()
    
    lazy var rightShoji: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Shoji-Right"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.opacity = 0.7
        return imageView
    }()
    
    lazy var leftShoji: UIView = {
        let imageView = UIImageView(image: UIImage(named: "Shoji-Left"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.opacity = 0.7
        return imageView
    }()
    
    func animateBackground(sender: String) {
        UIView.animate(withDuration: 0.5, animations: { [self] () -> Void in
            fadeInOut(in: false)
        },completion: {_ in
            UIView.animate(withDuration: 1.5, animations: { () -> Void in
                self.leftShoji.layer.position.x -= 1000
                self.rightShoji.layer.position.x += 1000
            },completion: {_ in
                self.delegate?.navigate(to: (sender))

            })
        })
    }
    
}
