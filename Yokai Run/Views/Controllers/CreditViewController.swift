//
//  CreditViewController.swift
//  Yokai Run
//
//  Created by Bof on 08/11/23.
//

import Foundation
import UIKit

class CreditViewController: UIViewController {
    lazy var creditView = CreditView()
    
    override func loadView() {
        view = creditView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
