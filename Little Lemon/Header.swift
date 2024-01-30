//
//  Header.swift
//  Little Lemon
//
//  Created by Brandon Schappaugh on 1/3/24.
//

import SwiftUI

struct Header: View {
    var withProfileIcon: Bool
    
    var body: some View {
        HStack{
            Rectangle()
                .fill(Color.clear)
                .frame(width: 60, height: 60)
            Spacer()
            Image("Logo")
            Spacer()
            Image("Profile")
                .resizable()
                .frame(width: 60, height: 60)
                .scaledToFit()
                .opacity(withProfileIcon ? 1 : 0)
        }
        .padding(.horizontal)
    }
}

#Preview {
    Header(withProfileIcon: true)
}
