//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Brandon Schappaugh on 12/22/23.
//

import Foundation

struct MenuItem: Decodable {
    enum CodingKeys: String, CodingKey { case
            title, image, price, category,
            desc = "description"
    }
    
    let title: String
    let image: String
    let price: String
    let desc: String
    let category: String
}
