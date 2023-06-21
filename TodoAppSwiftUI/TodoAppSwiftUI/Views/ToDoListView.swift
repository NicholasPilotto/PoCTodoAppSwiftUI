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
  
  init(userID: String) {
    self.userID = userID
  }
  
  var body: some View {
    NavigationView {
      VStack {
        
      }
      .navigationTitle("To Do List")
      .toolbar {
        Button {
          
        } label: {
          Image(systemName: "plus")
        }
      }
    }
  }
}

struct ToDoListItemsView_Previews: PreviewProvider {
  static var previews: some View {
    ToDoListView(userID: "")
  }
}
