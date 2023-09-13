//
//  Item.swift
//  DioFirstFinalChallenge
//
//  Created by Giugliano Severo on 11/09/23.
//

import Foundation

struct Item {
    
    var name: String
    var qnt: Int
    var type: ItemType
    
}

typealias Items = [Item]


class ItemList {
    
    internal var itemList: Items = []
    
    internal static let shared = ItemList()
    
    private init() {
        let milk = Item(name: "Leite", qnt: 2, type: .dairy)
        let tBone = Item(name: "T-bone", qnt: 3, type: .meat)
        let chocolate = Item(name: "Chocolate", qnt: 6, type: .snack)
        let rice = Item(name: "Arroz", qnt: 1, type: .cereal)
        
        itemList = [milk, tBone, chocolate, rice]
    }
    
    func addItem(item: Item) {
        itemList.append(item)
    }
    
    func removeItem(row: Int) {
        itemList.remove(at: row)
    }
    
}
