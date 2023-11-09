//
//  MenuViewModel.swift
//  Yokai Run
//
//  Created by Bof on 08/11/23.
//

import Foundation
import UIKit

protocol MenuViewDelegate: AnyObject {
    func navigate(to: String)
}

class MenuViewModel {
    weak var delegate: MenuViewDelegate?
        
    func onNavigate() {
        delegate?.navigate(to: "")
    }
    
}
