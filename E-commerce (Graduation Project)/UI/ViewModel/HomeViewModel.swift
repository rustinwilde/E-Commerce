//
//  HomeViewModel.swift
//  E-commerce (Graduation Project)
//
//  Created by Rustin Wilde on 26.12.22.
//

import Foundation
import RxSwift


class HomeViewModel {
    var foodList = BehaviorSubject <[Foods]>(value: [Foods]())
    var frepo = FoodsDaoRepository()
    
    init() {
        loadFoods()
        foodList = frepo.foodList
    }
    
    func loadFoods() {
       frepo.loadFoods()
    }
    
}
