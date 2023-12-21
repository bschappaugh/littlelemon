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
            VStack {

                NavigationLink(destination: Home(), isActive: $isLoggedIn) { EmptyView() }
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
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
                }
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
