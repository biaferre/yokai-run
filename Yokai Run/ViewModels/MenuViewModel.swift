//
//  MenuViewModel.swift
//  Yokai Run
//
//  Created by Bof on 08/11/23.
//

import Foundation
import UIKit

protocol NavigationDelegate: AnyObject {
    func navigate(to: String)
}

class MenuViewModel {
    weak var delegate: NavigationDelegate?
        
    func onNavigate() {
        delegate?.navigate(to: "")
    }
    
}
