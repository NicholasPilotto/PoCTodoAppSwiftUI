//
//  String+isCompletelyEmpty.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 17/06/23.
//

import Foundation

extension String {
  var isCompletelyEmpty: Bool {
    self.trimmingCharacters(in: .whitespaces).isEmpty
  }
}
