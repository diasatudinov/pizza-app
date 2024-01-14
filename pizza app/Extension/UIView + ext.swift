//
//  UIView + ext.swift
//  pizza app
//
//  Created by Dias Atudinov on 15.01.2024.
//

import UIKit

extension UIView {
    static func configure<T: UIView>(view: T, block: @escaping (T)->()) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        block(view)
        return view
    }
}
