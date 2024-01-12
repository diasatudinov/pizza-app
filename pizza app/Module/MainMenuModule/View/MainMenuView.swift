//
//  MainMenuView.swift
//  pizza app
//
//  Created by Dias Atudinov on 13.01.2024.
//

import UIKit

protocol MainMenuViewProtocol: AnyObject {
    
}

class MainMenuView: UIViewController {

    var presenter: MainMenuPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
     
}

extension MainMenuView: MainMenuViewProtocol {
    
}
