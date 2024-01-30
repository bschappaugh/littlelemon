//
//  Hero.swift
//  Little Lemon
//
//  Created by Brandon Schappaugh on 12/23/23.
//

import SwiftUI

struct Hero: View {
    @State var search = ""
    var body: some View {
        ZStack{
            
            VStack(alignment: .leading) {
                HStack{ Spacer() }
                Text("Little Lemon")
                    .foregroundColor(Color("Yellow"))
                    .font(.system(size: 64))
                    .padding(.leading)
                Text("Chicago")
                    .foregroundColor(Color("Secondary 3"))
                    .font(.system(size: 40))
                    .padding([.leading, .bottom])
                HStack {
                    
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .foregroundColor(Color("Secondary 3"))
                        .font(.system(size: 18))
                        .padding(.leading)
                    Image("Hero image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                } //:HStack
            } //:VStack
            .background(Color.darkGreen)
            .frame(
                minWidth: 0,
                maxWidth: .infinity
            )
            VStack(alignment: .trailing){
                HStack{ Spacer() }
                    .padding(.trailing)
                
                
            } //:VStack
        } //:ZStack
        
    }
}

#Preview {
    Hero()
}
