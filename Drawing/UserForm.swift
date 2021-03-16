//
//  UserForm.swift
//  Drawing
//
//  Created by George Patterson on 10/03/2021.
//

import SwiftUI



struct UserForm: View {
    
    @State var user: User
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter your first name", text: $user.fname).padding()
                    TextField("Enter your second name", text: $user.sname).padding()
                }
                Section {
                    TextField("Enter your age", text: $user.age).padding().keyboardType(.numberPad)
                    DatePicker("Enter your dob", selection: $user.birthday, displayedComponents: .date)
                    
                }

            }
            .toolbar {
                Button("Submit Form") {
                    
                }
            }
            .navigationBarTitle("UserConnect")
            .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)

        }
    }
}

struct UserForm_Previews: PreviewProvider {
    static var previews: some View {
        UserForm(user: User())
    }
}
