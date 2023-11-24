//
//  ArchiveViewController.swift
//  Yokai Run
//
//  Created by Bof on 08/11/23.
//

import Foundation
import UIKit

class ArchiveViewController: UIViewController {
    lazy var archiveView = ArchiveView()
    
    override func loadView() {
        view = archiveView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        view.layer.opacity = 0.0
        archiveView.fadeInOut()
    }
    
}
