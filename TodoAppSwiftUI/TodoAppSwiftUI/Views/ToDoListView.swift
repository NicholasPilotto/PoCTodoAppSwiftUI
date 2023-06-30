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
    viewModel.refreshItems(userId: self.userID)
  }
  
//  private mutating func refreshItems() {
//    viewModel.items.removeAll()
//
//    do {
//      let tmp = try RealmService.shared.fetch(with: User.self)
//      tmp.where {
//        $0._id.equals(self.userID)
//      }.first?.todos.forEach({
//        viewModel.items.append($0)
//      })
//
//    } catch {
//    }
//
//  }
  
  var body: some View {
    NavigationView {
      VStack {
        List(viewModel.items) { item in
          ToDoListItemView(item: item)
            .swipeActions {
              Button("Delete") {
                DispatchQueue.main.async {
                  viewModel.delete(item: item)
                }
              }
              .tint(.red)
            }
        }
        .listStyle(PlainListStyle())
        .refreshable {
          viewModel.refreshItems(userId: self.userID)
        }
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
    .onAppear() {
      viewModel.refreshItems(userId: self.userID)
    }
  }
}

//struct ToDoListItemsView_Previews: PreviewProvider {
//  static var previews: some View {
//    ToDoListView(userID: "")
//  }
//}
