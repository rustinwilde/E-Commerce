//
//  FoodsDaoRepository.swift
//  E-commerce (Graduation Project)
//
//  Created by Rustin Wilde on 25.12.22.
//

import Foundation
import Alamofire
import RxSwift


class FoodsDaoRepository {
    var foodList = BehaviorSubject <[Foods]>(value: [Foods]())
    var cartList = BehaviorSubject <[FoodsCart]>(value: [FoodsCart]())
    
    func loadFoods() {
        AF.request("http://kasimadalan.pe.hu/foods/getAllFoods.php",method: .get).response { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(ProductsResponse.self, from: data)
                    if let list = result.foods {
                        self.foodList.onNext(list)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func insertToCart(name: String, image: String, price: Int, category: String, orderAmount: Int, userName: String){
        let params : Parameters = ["name":name, "image":image, "price":price, "category":category, "orderAmount":orderAmount, "userName" : userName]
        AF.request("http://kasimadalan.pe.hu/foods/insertFood.php", method: .post, parameters: params).response {response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("Success: \(result.success!)")
                    print("Message: \(result.message!)\n")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func getFromCart (userName: String) {
        let params: Parameters = ["userName" : userName]
        AF.request("http://kasimadalan.pe.hu/foods/getFoodsCart.php", method: .post, parameters: params).response {response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(CartResponse.self, from: data)
                    if let list = result.foods_cart {
                        self.cartList.onNext(list)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func delete(cartId:Int, userName: String){
        let params:Parameters = ["cartId":cartId, "userName":userName]
        
        AF.request("http://kasimadalan.pe.hu/foods/deleteFood.php",method: .post,parameters: params).response { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("Success : \(result.success!)")
                    print("Message : \(result.message!)")
                    
                    self.loadFoods()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    
   
    
    
    
    
    
}

