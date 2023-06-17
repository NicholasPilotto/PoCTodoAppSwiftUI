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
  
  init() {}
  
  private func validate() -> Bool  {
    guard !name.isCompletelyEmpty, email.isValidEmailAddress, !password.isCompletelyEmpty else {
      return false
    }
    
    guard password.count >= 6 else {
      return false
    }
    
    insertUserRecord()
    
    return true
  }
  
  private func insertUserRecord() {
    let newUser = User(name: name, email: email, password: password)
  }
  
  func register() {
    guard validate() else {
      return
    }
  }
}
