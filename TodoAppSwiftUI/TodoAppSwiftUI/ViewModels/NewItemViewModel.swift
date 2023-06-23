//
//  NewItemViewModel.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import Foundation

class NewItemViewModel: ObservableObject {
  @Published var title = ""
  @Published var dueDate = Date()
  @Published var showAlert = false;
  
  var canSave: Bool {
    guard !title.isCompletelyEmpty else {
      return false
    }
    
    guard dueDate >= Date().addingTimeInterval(-86400) else {
      return false
    }
    
    return true
  }
  
  public init() {}
  
  public func save() {
    guard canSave else {
      return
    }
    
    let userID = UserDefaultsService.shared.userID
    
    let newModel = ToDoListItem(id: userID,
                                title: title,
                                dueData: dueDate.timeIntervalSince1970,
                                createdDate: Date().timeIntervalSince1970,
                                isDone: false)
    
    RealmService.shared.save(object: newModel) { result in
      switch result {
        case .success(): break
          
        case .failure(let error): break
          
      }
    }
  }
}
