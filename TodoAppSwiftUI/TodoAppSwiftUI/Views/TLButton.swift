//
//  TLButton.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 15/06/23.
//

import SwiftUI

struct TLButton: View {
  @State var title: String
  @State var background: Color
  @State var action: () -> Void
  
  var body: some View {
    Button {
      action()
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .foregroundColor(background)
        
        Text(title)
          .foregroundColor(Color.white)
          .bold()
      }
    }
    .padding()
  }
}

struct TLButton_Previews: PreviewProvider {
  static var previews: some View {
    TLButton(title: "Log In", background: .blue, action: {
      print("Pressed")
    })
  }
}
