//
//  CartResponse.swift
//  E-commerce (Graduation Project)
//
//  Created by Rustin Wilde on 02.01.23.
//

import Foundation

struct CartResponse : Codable {
    var foods_cart : [FoodsCart]?
}
