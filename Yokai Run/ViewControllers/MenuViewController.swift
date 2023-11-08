//
//  MenuViewController.swift
//  Yokai Run
//
//  Created by Bof on 07/11/23.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    lazy var menuView = MenuView()
    
    override func loadView() {
        view = menuView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

class CreditsViewController: UIViewController {
    lazy var archiveView = ArchiveView()
    
    override func loadView() {
        view = archiveView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

class ArchiveViewController: UIViewController {
    lazy var creditView = CreditView()
    
    override func loadView() {
        view = creditView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

