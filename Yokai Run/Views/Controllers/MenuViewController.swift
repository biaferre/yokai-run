//
//  MenuViewController.swift
//  Yokai Run
//
//  Created by Bof on 07/11/23.
//

import Foundation
import UIKit

class MenuViewController: UIViewController, NavigationDelegate {
    
    var viewModel: MenuViewModel = MenuViewModel()

    lazy var menuView: MenuView = {
        let view = MenuView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        view = menuView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.menuView.fadeInOut(in: true)
    }
    
    func navigate(to: String) {
        if to == "Credits" {
            navigationController?.isNavigationBarHidden = false

            navigationController?.pushViewController(CreditViewController(), animated: false)
        }
        else if to == "Start" {
            navigationController?.isNavigationBarHidden = true
            navigationController?.pushViewController(GameViewController(), animated: false)
        
        }
        else {
            navigationController?.isNavigationBarHidden = false

            navigationController?.pushViewController(ArchiveViewController(), animated: false)
        }
    }
    
}

