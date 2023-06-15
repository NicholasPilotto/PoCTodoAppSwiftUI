//
//  RegisterView.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import SwiftUI

struct RegisterView: View {
  @State var name = ""
  @State var email = ""
  @State var password = ""
  
  var body: some View {
    VStack {
      HeaderView(title: "Register",
                 subtitle: "Start organizing todos",
                 angle: -15,
                 background: .orange)
      
      Form {
        TextField("Full name", text: $name)
          .textFieldStyle(DefaultTextFieldStyle())
          .autocorrectionDisabled()
        
        TextField("Email address", text: $email)
          .textFieldStyle(DefaultTextFieldStyle())
          .autocapitalization(.none)
          .autocorrectionDisabled()
        
        SecureField("Password", text: $password)
          .textFieldStyle(DefaultTextFieldStyle())
        
        TLButton(title: "Create an Account", background: .green, action: {
          
        })
      }
      .offset(y: -50)
      
      Spacer()
    }
    
  }
}

struct RegisterView_Previews: PreviewProvider {
  static var previews: some View {
    RegisterView()
  }
}
