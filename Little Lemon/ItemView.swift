//
//  ItemView.swift
//  Little Lemon
//
//  Created by Brandon Schappaugh on 2/18/24.
//

import SwiftUI

struct ItemView: View {
    let dishName: String
    let dishPrice: String
    let dishDescription: String
    let dishImageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: dishImageURL)) { image in
            image.image?.resizable()
        }
            .frame(height: 300)
            .cornerRadius(10)
            .padding([.top, .leading, .trailing])
        
        Text(dishName)
            .fontWeight(.bold)
            .padding(.top)
        
        VStack(alignment: .leading) {
            Text("$\(dishPrice)")
                .padding(.vertical)
            Text(dishDescription)
        }
        .padding(.horizontal)
        
        Spacer()
        
        Button(action: {
            
        }) {
            Text("Add to Cart")
                .foregroundColor(Color("Secondary 4"))
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color("Yellow"))
        .cornerRadius(10)
        .padding(.horizontal)
        
        
        Spacer()
    }
}

#Preview {
    ItemView(dishName: "Dish 1", dishPrice: "0.00", dishDescription: "This is the dish description", dishImageURL: "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/bruschetta.jpg?raw=true")
}
