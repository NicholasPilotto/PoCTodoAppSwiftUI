//
//  ToDoListItemView.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import SwiftUI

struct ToDoListItemView: View {
  let item: ToDoListItem
  
    var body: some View {
      HStack {
        VStack(alignment: .leading) {
          Text(item.title)
            .font(.body)
          
          Text("\(Date(timeIntervalSince1970: item.dueData).formatted(date: .abbreviated, time: .shortened))")
            .font(.footnote)
            .foregroundColor(Color(.secondaryLabel))
        }
        
        Spacer()
        
        Button {
          
        } label: {
          Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
        }
      }
    }
}

//struct ToDoListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ToDoListItemView()
//    }
//}
