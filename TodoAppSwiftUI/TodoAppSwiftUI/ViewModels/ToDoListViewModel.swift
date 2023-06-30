//
//  ToDoListItemsViewModel.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import Foundation

class ToDoListViewModel: ObservableObject {
  @Published var showingNewItemView = false {
    didSet {
      self.refreshItems(userId: UserDefaultsService.shared.userID)
    }
  }
  @Published var items = [ToDoListItem]()
  
  public init() {}
  
  public func refreshItems(userId: String) {
    items.removeAll()

    do {
      let tmp = try RealmService.shared.fetch(with: User.self)
      tmp.where {
        $0._id.equals(userId)
      }.first?.todos.forEach({
        if (!$0.isInvalidated) {        
          items.append($0)
        }
      })

    } catch {
    }

  }
  
  public func delete(item: ToDoListItem) {
    RealmService.shared.delete(object: item) { result in
      switch result {
        case .success():
          break
        case.failure(let error):
          print(error)
      }
    }
    
//    self.refreshItems(userId: UserDefaultsService.shared.userID)
  }
}
