//
//  Foods Cart.swift
//  E-commerce (Graduation Project)
//
//  Created by Rustin Wilde on 01.01.23.
//

import Foundation

class FoodsCart : Codable {
    var cartId : Int
    var name : String
    var image : String
    var price : Int
    var category : String
    var orderAmount : Int
    var userName = "rustin_wilde"
    
     init(cartId: Int, name: String, image: String, price: Int, category: String, orderAmount: Int, userName: String = "rustin_wilde") {
        self.cartId = cartId
        self.name = name
        self.image = image
        self.price = price
        self.category = category
        self.orderAmount = orderAmount
        self.userName = userName
    }
    
}
