//
//  LoginViewModel.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import Foundation

class LoginViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var errorMessage = ""
  
  init() {}
  
  func logIn() {
    guard validate() else {
      return
    }
  }
  
  private func validate() -> Bool {
    errorMessage = ""
  
    guard email.isValidEmailAddress, !password.isCompletelyEmpty else {
      errorMessage = "Please fill in all fieldss"
      return false
    }
    
    return true
  }
}
