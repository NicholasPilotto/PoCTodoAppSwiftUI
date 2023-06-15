//
//  LoginView.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import SwiftUI

struct LoginView: View {
  @State var viewModel = LoginViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        HeaderView(title: "ToDo List", subtitle: "Get things done", angle: 15, background: .pink)
        Form {
          TextField("Email Address", text: $viewModel.email)
            .textFieldStyle(DefaultTextFieldStyle())
            .autocapitalization(.none)
            .autocorrectionDisabled()
          
          SecureField("Password", text: $viewModel.password)
            .textFieldStyle(DefaultTextFieldStyle())
          
          TLButton(title: "Log In", background: .blue, action: {
            
          })
        }
        .background(Color.white)
        .offset(y: -50)
        
        VStack {
          Text("New around here?")
          NavigationLink("Create an account", destination: RegisterView())
        }
        .padding(.bottom, 50)
        
        Spacer()
      }
    }
  }
}


struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
