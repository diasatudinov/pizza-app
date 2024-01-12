//
//  Builder.swift
//  pizza app
//
//  Created by Dias Atudinov on 13.01.2024.
//

import UIKit

protocol BuilderProtocol{
     static func getMainMenuController() -> UIViewController
    
}

class Builder: BuilderProtocol {
    static func getMainMenuController() -> UIViewController {
        MainMenuView()
    }
}
