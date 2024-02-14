//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Brandon Schappaugh on 12/20/23.
//

import SwiftUI

struct UserProfile: View {
    @State var firstName = UserDefaults.standard.string(forKey: kFirstName)!
    @State var lastName = UserDefaults.standard.string(forKey: kLastName)!
    @State var email = UserDefaults.standard.string(forKey: kEmail)!
    @State private var isDisabled = true
    @State private var editLabel = "Edit"
    
    @Environment(\.presentationMode) var presentation
    
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
                    .disabled(isDisabled)

                
                Text("Last name")
                    .padding(.top)
                TextField("Last Name", text: $lastName)
                    .padding(10)
                    .border(Color("Secondary 3"), width: 3)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    .disabled(isDisabled)
                    
                
                Text("Email")
                    .padding(.top)
                TextField("Email", text: $email)
                    .padding(10)
                    .border(Color("Secondary 3"), width: 3)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    .disabled(isDisabled)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("Log out")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Secondary 4"))
                            
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("Yellow"))
                    .cornerRadius(10)
                    
                    Button(action: {
                        if isDisabled == true {
                            isDisabled.toggle()
                            editLabel = "Save"
                        } else {
                            isDisabled.toggle()
                            editLabel = "Edit"
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                        }
                    }) {
                        Text(editLabel)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("Dark Green"))
                    .foregroundStyle(Color("Secondary 3"))
                    .fontWeight(.bold)
                    .cornerRadius(10)
                }
                Spacer()
            }
            .padding()
    }
}

//#Preview {
//    UserProfile()
//}
