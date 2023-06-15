//
//  LoginView.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import SwiftUI

struct LoginView: View {
  @State var email = ""
  @State var password = ""
  
  var body: some View {
    NavigationView {
      
      VStack {
        HeaderView(title: "ToDo List", subtitle: "Get things done", angle: 15, background: .pink)
        Form {
          TextField("Email Address", text: $email)
            .textFieldStyle(DefaultTextFieldStyle())
          SecureField("Password", text: $password)
            .textFieldStyle(DefaultTextFieldStyle())
          
          Button {
            
          } label: {
            ZStack {
              RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.blue)
              
              Text("Log In")
                .foregroundColor(Color.white)
                .bold()
            }
          }
          .padding()
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
