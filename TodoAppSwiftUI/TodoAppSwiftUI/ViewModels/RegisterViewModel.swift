//
//  RegisterViewModel.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import Foundation

class RegisterViewModel: ObservableObject {
  @Published var name = ""
  @Published var email = ""
  @Published var password = ""
  @Published var error = ""
  
  init() {}
  
  private func validate() -> Bool  {
    guard !name.isCompletelyEmpty, email.isValidEmailAddress, !password.isCompletelyEmpty else {
      return false
    }
    
    guard password.count >= 6 else {
      return false
    }
    
    return true
  }
  
  private func insertUserRecord() {
    let newUser = User(name: name, email: email, password: password)
    RealmService.shared.save(object: newUser) { [weak self] result in
      guard let self = self else {
        return
      }
      
      switch result {
        case .success():
          self.error = ""
          UserDefaultsService.shared.userID = newUser._id
          
        case .failure(let error):
          self.error = error.localizedDescription
      }
    }
  }
  
  func register() {
    guard validate() else {
      return
    }
    insertUserRecord()
  }
}
