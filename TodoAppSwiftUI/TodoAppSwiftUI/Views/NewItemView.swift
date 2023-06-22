//
//  NewItemView.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import SwiftUI

struct NewItemView: View {
  @StateObject var viewModel = NewItemViewModel()
  @Binding var newItemPresented: Bool
  
    var body: some View {
      VStack {
        Text("New item")
          .font(.system(size: 32))
          .bold()
          .padding(.top, 100)
        
        Form {
          TextField("Title", text: $viewModel.title)
            .textFieldStyle(DefaultTextFieldStyle())
          
          DatePicker("Due date", selection: $viewModel.dueDate)
            .datePickerStyle(GraphicalDatePickerStyle())
          
          TLButton(title: "Save", background: .pink, action: {
            viewModel.save()
            newItemPresented = false
          })
          .padding()
        }
      }
    }
}

//struct NewItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewItemView()
//    }
//}
