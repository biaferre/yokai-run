//
//  NavigationManager.swift
//  Yokai Run
//
//  Created by Bof on 22/11/23.
//

import Foundation
import UIKit

class NavigationManager: UINavigationController {
    static let shared = NavigationManager(rootViewController: MenuViewController())
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
