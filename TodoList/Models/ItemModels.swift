//
//  ItemModels.swift
//  TodoList
//
//  Created by Bui Ngoc Duc on 10/5/24.
//

import Foundation


struct ItemModels : Identifiable, Codable{
    let id: String
    let title: String
    let isCompleed: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleed: Bool) {
        self.id = id
        self.title = title
        self.isCompleed = isCompleed
    }
    
    func updatecompletion() -> ItemModels {
        return ItemModels(id: id, title: title, isCompleed: !isCompleed)
    }
}
