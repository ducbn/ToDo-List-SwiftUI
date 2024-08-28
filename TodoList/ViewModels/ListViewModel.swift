//
//  ListViewModel.swift
//  TodoList
//
//  Created by Bui Ngoc Duc on 10/5/24.
//

import Foundation

class ListViewModel : ObservableObject{
    
    @Published var items: [ItemModels] = []{
        didSet{
            saveItem()
        }
    }
    let itemsKey: String = "items_list"
    
    init (){
        getItem()
    }
     
    func getItem(){
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModels].self, from: data)
        else { return }
        self.items = saveItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModels(title: title, isCompleed: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModels){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updatecompletion()
        }
    }
    
    func saveItem(){
        if let encodeedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeedData, forKey: itemsKey)
        }
    }
}
