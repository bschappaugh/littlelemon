//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Brandon Schappaugh on 12/20/23.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.string(forKey: kFirstName)
    let lastName = UserDefaults.standard.string(forKey: kLastName)
    let email = UserDefaults.standard.string(forKey: kEmail)
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack{
            Text("Personal information")
            Image("profile-image-placeholder")
                .resizable()
                .frame(width: 100, height: 100)
            Text(firstName ?? "")
            Text(lastName ?? "")
            Text(email ?? "")
            Button(action: {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Logout")
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
