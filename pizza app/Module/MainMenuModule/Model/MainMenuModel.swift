//
//  MainMenuModel.swift
//  pizza app
//
//  Created by Dias Atudinov on 14.01.2024.
//

import Foundation

class PositionData: Identifiable {
    let id = UUID().uuidString
    let items: [MenuItem]
    init(items: [MenuItem]) {
        self.items = items
    }
    
    static func getMockData() -> [MenuItem] {
        [
        MenuItem(image: "pizza1", name: "Ветчина и грибы", description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус", price: 345),
        MenuItem(image: "pizza2", name: "Баварские колбаски", description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус", price: 345),
        MenuItem(image: "pizza3", name: "Нежный лосось", description: "Лосось, томаты черри, моцарелла, соус песто", price: 345),
        MenuItem(image: "pizza4", name: "Пицца четыре сыра", description: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)", price: 345)
        ]
    }
}


class MenuItem: Identifiable {
    let id = UUID().uuidString
    let image: String
    let name: String
    let description: String
    let price: Int
    
    init(image: String, name: String, description: String, price: Int) {
        self.image = image
        self.name = name
        self.description = description
        self.price = price
    }
}
