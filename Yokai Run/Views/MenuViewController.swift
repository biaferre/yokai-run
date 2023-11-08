//
//  MenuViewController.swift
//  Yokai Run
//
//  Created by Bof on 07/11/23.
//

import Foundation
import UIKit

class MenuViewController: UIViewController, MenuViewDelegate {
    
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
    
    func navigate(to: String) {
        if to == "Credits" {
            navigationController?.pushViewController(CreditViewController(), animated: true)
        }
        else if to == "Start" {
            print("start")
//            navigationController?.pushViewController(GameViewController(), animated: true)
        }
        else {
            navigationController?.pushViewController(ArchiveViewController(), animated: true)
        }
    }
    
}

