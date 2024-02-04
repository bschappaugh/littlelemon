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
            
        NavigationView {
            VStack(alignment: .leading){
                Text("Personal information")
                    .fontWeight(.bold)
                    .font(.system(size:20))
                
                Image("Profile")
                    .resizable()
                .frame(width: 100, height: 100)
                
                Text("First name")
                    .padding(.top)
                Text(firstName ?? "asdf")
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .border(Color("Secondary 3"), width: 3)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))

                
                Text("Last name")
                    .padding(.top)
                Text(lastName ?? "asdf")
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .border(Color("Secondary 3"), width: 3)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    
                
                Text("Email")
                    .padding(.top)
                Text(email ?? "adsf")
                    .padding(10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .border(Color("Secondary 3"), width: 3)
                    .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    .padding(.bottom)
                
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
                    
                    NavigationLink {
                        EditUserProfile()
                    } label: {
                        Text("Edit")
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
}

#Preview {
    UserProfile()
}
