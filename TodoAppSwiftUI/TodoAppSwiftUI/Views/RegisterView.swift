//
//  RegisterView.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import SwiftUI

struct RegisterView: View {
  @StateObject var viewModel = RegisterViewModel()
  
  var body: some View {
    VStack {
      HeaderView(title: "Register",
                 subtitle: "Start organizing todos",
                 angle: -15,
                 background: .orange)
      
      Form {
        TextField("Full name", text: $viewModel.name)
          .textFieldStyle(DefaultTextFieldStyle())
          .autocorrectionDisabled()
        
        TextField("Email address", text: $viewModel.email)
          .textFieldStyle(DefaultTextFieldStyle())
          .autocapitalization(.none)
          .autocorrectionDisabled()
        
        SecureField("Password", text: $viewModel.password)
          .textFieldStyle(DefaultTextFieldStyle())
        
        TLButton(title: "Create an Account", background: .green, action: {
          viewModel.register()
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
