//
//  UIViewController+UIViewControllerRepresentable.swift
//  Yokai Run
//
//  Created by Bof on 25/11/23.
//

import Foundation
#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension UIViewController {
    @available(iOS 13, *)
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController { viewController }
        func updateUIViewController(_ viewController: UIViewController, context: Context) { }
    }

    @available(iOS 13, *)
    func showPreview() -> some View {
        Preview(viewController: self).statusBar(hidden: true)
    }
}

extension UIView {
    @available(iOS 13, *)
    private struct Preview: UIViewRepresentable {
        let view: UIView
        
        func makeUIView(context: Context) -> UIView { view }
        func updateUIView(_ uiView: UIView, context: Context) { }
    }
    
    @available(iOS 13, *)
    func showPreview() -> some View {
        Preview(view: self)
    }
}

#endif

