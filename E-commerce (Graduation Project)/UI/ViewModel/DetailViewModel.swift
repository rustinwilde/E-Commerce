//
//  DetailViewModel.swift
//  E-commerce (Graduation Project)
//
//  Created by Rustin Wilde on 26.12.22.
//

import Foundation
import RxSwift

class DetailViewModel {

    var frepo = FoodsDaoRepository()
    
    func insertToCart(name: String, image: String, price: Int, category: String, orderAmount: Int, userName: String) {
        frepo.insertToCart(name: name, image: image, price: price, category: category, orderAmount: orderAmount, userName: userName)
    }
    
    
}

