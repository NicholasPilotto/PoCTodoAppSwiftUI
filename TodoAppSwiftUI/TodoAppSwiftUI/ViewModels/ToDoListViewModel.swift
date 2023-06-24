//
//  ToDoListItemsViewModel.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import Foundation

class ToDoListViewModel: ObservableObject {
  @Published var showingNewItemView = false
  
  public init() {}
  
  public func delete(itemId: String) {
    print(itemId)
  }
}
