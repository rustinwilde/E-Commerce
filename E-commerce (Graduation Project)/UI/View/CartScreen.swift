//
//  CartScreen.swift
//  E-commerce (Graduation Project)
//
//  Created by Rustin Wilde on 28.12.22.
//

import Foundation
import UIKit

class CartScreen : UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var cartTableView: UITableView!
    
    var cart : FoodsCart?
    var foodsCart = [FoodsCart]()
    var viewModel = CartViewModel()
    
   public var userName = "rustin_wilde"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let _ = viewModel.cartList.subscribe(onNext: { list in
            self.foodsCart = list
            DispatchQueue.main.async {
                self.cartTableView.reloadData()
            }
        })
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        //register xib
        cartTableView.register(UINib(nibName: "ProductsTableViewCell", bundle: nil), forCellReuseIdentifier: "productCell")
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getFromCart(userName: userName)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodsCart.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let foodCart = foodsCart[indexPath.row]
        let cell = cartTableView.dequeueReusableCell(withIdentifier: "productCell") as! ProductsTableViewCell
        cell.configure(item: foodCart)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0;
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? { ////which controls the swipe left to right where we define the menu options and corresponding actions (configuration) for each swipe gesture.
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ ////we use style  ".destructive" to highlight title with red
            (action,view,bool) in
            
            let foodCart = self.foodsCart[indexPath.row] // Choose exact row in array
            let alert = UIAlertController(title: "Deletion Process", message: "Do you want to delete \(foodCart.name)", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) // Adding cancel action
            alert.addAction(cancel)
            let yesAction = UIAlertAction(title: "Yes", style: .destructive) { [self] action in // Adding Delete action
                self.viewModel.delete(cartId: foodCart.cartId, userName: foodCart.userName) // An action that tell what will be if you press "Yes"
                print("\(foodCart.name) is deleted")
                self.viewModel.getFromCart(userName: userName)
            }
            self.present(alert, animated: true) // if we won't write this then the delete action won't be executed
            alert.addAction(yesAction)
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}


