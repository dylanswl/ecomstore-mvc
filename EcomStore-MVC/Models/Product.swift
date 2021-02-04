//
//  Product.swift
//  EcomStore-MVC
//
//  Created by Dylan Sewell on 2/4/21.
//

import Foundation

struct Product {
    let id: UUID
    let name: String
    let cost: Int
    let description: String
    
    init(name: String, cost: Int, description: String) {
        self.id = UUID()
        self.name = name
        self.cost = cost
        self.description = description
    }
}
