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
    var currentUser: User?
    
    do {
      let tmp = try RealmService.shared.fetch(with: User.self)
        .where {
          $0._id.equals(userID)
        }
      
      currentUser = tmp.first
    } catch {
      print(error)
    }
    
    
    let newModel = ToDoListItem(id: UUID().uuidString,
                                title: title,
                                dueData: dueDate.timeIntervalSince1970,
                                createdDate: Date().timeIntervalSince1970,
                                isDone: false)
  
    
    guard let currentUser = currentUser else {
      return
    }
    
    RealmService.shared.updateTodosList(object: newModel, user: currentUser) { result in
      switch result {
        case .success(): break
          
        case .failure(let error):
          print(error)
      }
    }
  }
}
