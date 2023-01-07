//
//  CartViewModel.swift
//  E-commerce (Graduation Project)
//
//  Created by Rustin Wilde on 26.12.22.
//

import Foundation
import RxSwift

class CartViewModel {

    var cartList = BehaviorSubject <[FoodsCart]>(value: [FoodsCart]())
    var frepo = FoodsDaoRepository()
    
    init() {
        cartList = frepo.cartList
    }
    
    func getFromCart(userName:String) {
        frepo.getFromCart(userName: userName)
    }
    
    func delete(cartId:Int, userName:String){
        frepo.delete(cartId: cartId, userName: userName)
    }
}
