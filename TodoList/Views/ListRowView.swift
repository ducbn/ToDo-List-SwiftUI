//
//  ListRowView.swift
//  TodoList
//
//  Created by Bui Ngoc Duc on 8/5/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModels
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleed ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleed ? .green : .red)
            Text(item.title)
            Spacer()
            
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModels(title: "yeu bit vai lon", isCompleed: false)
    
    static var previews: some View{
        Group {
            ListRowView(item: item1)
        }
        .previewLayout(.sizeThatFits)
    }
}
