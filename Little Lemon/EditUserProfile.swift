//
//  EditUserProfile.swift
//  Little Lemon
//
//  Created by Brandon Schappaugh on 2/3/24.
//

import SwiftUI

struct EditUserProfile: View {
    @State var firstName = UserDefaults.standard.string(forKey: kFirstName)!
    @State var lastName = UserDefaults.standard.string(forKey: kLastName)!
    @State var email = UserDefaults.standard.string(forKey: kEmail)!
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Personal information")
                .fontWeight(.bold)
                .font(.system(size:20))
            
            Image("Profile")
                .resizable()
            .frame(width: 100, height: 100)
            
            Text("First name")
                .padding(.top)
            TextField("First Name", text: $firstName)
                .padding(10)
                .border(Color("Secondary 3"), width: 3)
                .clipShape(RoundedRectangle(cornerRadius: 5.0))

            
            Text("Last name")
                .padding(.top)
            TextField("Last Name", text: $lastName)
                .padding(10)
                .border(Color("Secondary 3"), width: 3)
                .clipShape(RoundedRectangle(cornerRadius: 5.0))
                
            
            Text("Email")
                .padding(.top)
            TextField("Email", text: $email)
                .padding(10)
                .border(Color("Secondary 3"), width: 3)
                .clipShape(RoundedRectangle(cornerRadius: 5.0))
            
            Button(action: {
                if (firstName.isEmpty || lastName.isEmpty || email.isEmpty) {
                    print("An Input Field Is Empty")
                } else {
                    UserDefaults.standard.set(firstName, forKey: kFirstName)
                    print(firstName)
                    UserDefaults.standard.set(lastName, forKey: kLastName)
                    print(lastName)
                    UserDefaults.standard.set(email, forKey: kEmail)
                    dismiss()
                }
            }) {
                Text("Save")
                    .foregroundColor(Color("Secondary 4"))
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            .frame(maxWidth: .infinity)
            .background(Color("Yellow"))
            .cornerRadius(10)
            .padding(.horizontal)
            
            
            Spacer()
        }
        .padding()
    }
}

//#Preview {
//    EditUserProfile()
//}
