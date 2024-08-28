//
//  TodoListApp.swift
//  TodoList
//
//  Created by Bui Ngoc Duc on 8/5/24.
//

import SwiftUI



@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
