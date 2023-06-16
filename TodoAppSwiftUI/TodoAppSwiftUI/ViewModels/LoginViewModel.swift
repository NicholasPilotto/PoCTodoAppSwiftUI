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
  
    guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
          isValidEmailAddress(),
          !password.trimmingCharacters(in: .whitespaces).isEmpty else {
      errorMessage = "Please fill in all fieldss"
      return false
    }
    
    return true
  }
  
  private func isValidEmailAddress() -> Bool {
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
    return emailPredicate.evaluate(with: email)
  }
}
