//
//  ArchiveView+Transitions.swift
//  Yokai Run
//
//  Created by Bof on 25/11/23.
//

import Foundation
import UIKit

extension ArchiveView {
    func fadeInOut() {
        UIView.animate(withDuration: 0.5) {
                self.layer.opacity = 1.0
        }
    }
    
    @objc func toggleModelVisibility() {
        UIView.animate(withDuration: 0.5) {
            self.uncollectedModel.isHidden.toggle()
        }
    }
    
    @objc func selectSkin(_ sender: UIButton) {
        if let index = buttonStack.arrangedSubviews.firstIndex(of: sender) {
            let selectedSkin = UserDefaultsManager.shared.skins[index]
            
            
            if selectedSkin.isEnabled {
                if let encodedNewSkin = try? JSONEncoder().encode(selectedSkin) {
                    userDefaults.set(encodedNewSkin, forKey: UserDefaultsManager.shared.selectedSkinKey)
                }
            }
            else {
                toggleModelVisibility()
            }
        }
    }
}
