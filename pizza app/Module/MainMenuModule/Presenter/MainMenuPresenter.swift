//
//  MainMenuPresenter.swift
//  pizza app
//
//  Created by Dias Atudinov on 13.01.2024.
//

import UIKit

protocol MainMenuPresenterProtocol: AnyObject {
    init(view: MainMenuViewProtocol)
    
}

class MainMenuPresenter {
    weak var view: MainMenuViewProtocol?
    
    required init(view: MainMenuViewProtocol) {
        self.view = view
    }
}

extension MainMenuPresenter: MainMenuPresenterProtocol {
    
}
