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
      self.items = try RealmService.shared.fetch(with: ToDoListItem.self).map { $0 }
    } catch {
      
    }
    
  }
  
  var body: some View {
    NavigationView {
      VStack {
        
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
