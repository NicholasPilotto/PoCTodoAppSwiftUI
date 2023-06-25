//
//  ToDoListItemsViewModel.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import Foundation

class ToDoListViewModel: ObservableObject {
  @Published var showingNewItemView = false
  @Published var items: [ToDoListItem] = []
  
  public init() {
    getAllTodos(userId: UserDefaultsService.shared.userID)
  }
  
  public func getAllTodos(userId: String) {
    do {
      let tmp = try RealmService.shared.fetch(with: User.self)
      tmp.where {
        $0._id.equals(userId)
      }.first?.todos.forEach({
        self.items.append($0)
      })
    } catch {
      print(error)
    }
  }
  
  public func delete(itemId: String) {
    print(itemId)
  }
}
