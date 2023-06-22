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
  
  public func save() {}
}
