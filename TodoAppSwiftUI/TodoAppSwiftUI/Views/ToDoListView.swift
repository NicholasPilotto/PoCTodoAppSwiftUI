//
//  ToDoListItemsView.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import SwiftUI

struct ToDoListView: View {
  @StateObject var viewModel = ToDoListViewModel()
  private let userID: String
  var items: [ToDoListItem] = []
  
  init(userID: String) {
    self.userID = userID
    
    do {
      let tmp = try RealmService.shared.fetch(with: User.self)
      tmp.where {
        $0._id.equals(self.userID)
      }.first?.todos.forEach({
        self.items.append($0)
      })
      
      print(tmp.first?.todos)
    } catch {
      
    }
    
  }
  
  var body: some View {
    NavigationView {
      VStack {
        List(self.items) { item in
          ToDoListItemView(item: item)
            .swipeActions {
              Button("Delete") {
                viewModel.delete(itemId: item.id)
              }
            }
        }
        .listStyle(PlainListStyle())
      }
      .navigationTitle("To Do List")
      .toolbar {
        Button {
          viewModel.showingNewItemView = true
        } label: {
          Image(systemName: "plus")
        }
      }
      .sheet(isPresented: $viewModel.showingNewItemView) {
        NewItemView(newItemPresented: $viewModel.showingNewItemView)
      }
    }
  }
}

//struct ToDoListItemsView_Previews: PreviewProvider {
//  static var previews: some View {
//    ToDoListView(userID: "")
//  }
//}
