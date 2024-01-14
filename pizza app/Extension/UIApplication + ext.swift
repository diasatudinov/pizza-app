//
//  UIApplication + ext.swift
//  pizza app
//
//  Created by Dias Atudinov on 14.01.2024.
//

import UIKit

extension UIApplication {
    static var topSafeArea: CGFloat {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene?.windows.first?.safeAreaInsets.top ?? .zero
    }
}
