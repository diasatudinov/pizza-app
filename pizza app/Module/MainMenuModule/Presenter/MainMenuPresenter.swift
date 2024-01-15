//
//  MainMenuPresenter.swift
//  pizza app
//
//  Created by Dias Atudinov on 13.01.2024.
//

import UIKit

protocol MainMenuPresenterProtocol: AnyObject {
    init(view: MainMenuViewProtocol)
    var positions: [MenuItem]? {get set}
    func getPositions()
}

class MainMenuPresenter {
    weak var view: MainMenuViewProtocol?
    var positions: [MenuItem]?
    required init(view: MainMenuViewProtocol) {
        self.view = view
        getPositions()
    }
    
    
}

extension MainMenuPresenter: MainMenuPresenterProtocol {
    func getPositions() {
        self.positions = PositionData.getMockData()
        view?.showPositions()
    }
}
