//
//  String+isValidEmailAddress.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 17/06/23.
//

import Foundation

extension String {
  var isValidEmailAddress: Bool {
    guard !self.isCompletelyEmpty else {
      return false
    }
    
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
    return emailPredicate.evaluate(with: self)
  }
}
