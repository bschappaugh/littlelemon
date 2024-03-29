//
//  Home.swift
//  Little Lemon
//
//  Created by Brandon Schappaugh on 12/20/23.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    
    var body: some View {
        Header(withProfileIcon: true)
        TabView{
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .tabItem({Label("Menu", systemImage: "list.dash")})
            UserProfile()
                .tabItem({Label("Profile", systemImage: "square.and.pencil")})
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
