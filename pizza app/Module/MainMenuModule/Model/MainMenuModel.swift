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
        MenuItem(image: "pizza4", name: "Пицца четыре сыра", description: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)", price: 345),
        
        MenuItem(image: "pizza1", name: "Комбо Ветчина и грибы", description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус + напиток и фри", price: 500),
        MenuItem(image: "pizza2", name: "Комбо Баварские колбаски", description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус + напиток и фри", price: 550),
        MenuItem(image: "pizza3", name: "Комбо Нежный лосось", description: "Лосось, томаты черри, моцарелла, соус песто + напиток и фри", price: 600),
        MenuItem(image: "pizza4", name: "Комбо Пицца четыре сыра", description: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый) + напиток и фри", price: 575),
        
        MenuItem(image: "desert1", name: "Мороженое", description: "Сливочное мороженое", price: 200),
        MenuItem(image: "desert2", name: "Эклер", description: "", price: 100),
        MenuItem(image: "desert3", name: "Кекс клубничный", description: "Тесто, клубничный крем, вишня", price: 75),
        MenuItem(image: "desert4", name: "Кекс шоколадный", description: "Шоколад, тесто, крем, вишня", price: 75),
        
        MenuItem(image: "coffee", name: "Кофе", description: "", price: 200),
        MenuItem(image: "energyDrink", name: "Энергетик", description: "", price: 150),
        MenuItem(image: "lemonade", name: "Лимонад", description: "", price: 250),
        MenuItem(image: "water", name: "Вода", description: "", price: 100),
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
