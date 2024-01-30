//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Brandon Schappaugh on 12/19/23.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"


struct Onboarding: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                Header(withProfileIcon: false)
                Hero()

                NavigationLink(destination: Home(), isActive: $isLoggedIn) { EmptyView() }
                
                Text("First Name")
                    .padding([.top, .leading, .trailing])
                TextField("First Name", text: $firstName)
                    .padding(10)
                    .border(Color("Secondary 3"), width: 3)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    .padding([.leading, .bottom, .trailing])
                
                Text("Last Name")
                    .padding(.horizontal)
                TextField("Last Name", text: $lastName)
                    .padding(10)
                    .border(Color("Secondary 3"), width: 3)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    .padding([.leading, .bottom, .trailing])
                
                Text("Email")
                    .padding(.horizontal)
                TextField("Email", text: $email)
                    .padding(10)
                    .border(Color("Secondary 3"), width: 3)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    .padding(.horizontal)
                    
                    
                Spacer()
                Button(action: {
                    if (firstName.isEmpty || lastName.isEmpty || email.isEmpty) {
                        print("An Input Field Is Empty")
                    } else {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        isLoggedIn = true
                        UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                    }
                }) {
                    Text("Register")
                        .foregroundColor(Color("Secondary 4"))
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
                .frame(maxWidth: .infinity)
                .background(Color("Yellow"))
                .cornerRadius(10)
                .padding(.horizontal)
            }
            .onAppear(perform: {
                if (UserDefaults.standard.bool(forKey: kIsLoggedIn)) {
                    isLoggedIn = true
                }
            })
        }
    }
}

#Preview {
    Onboarding()
}
