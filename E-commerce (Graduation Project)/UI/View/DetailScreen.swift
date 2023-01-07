//
//  DetailScreen.swift
//  E-commerce (Graduation Project)
//
//  Created by Rustin Wilde on 24.12.22.
//Edited
import Foundation
import UIKit
import Kingfisher



class DetailScreen: UIViewController {
    
    @IBOutlet var detailImage: UIImageView!
    var detailImageC : String!
    
    @IBOutlet var totalPricelbl: UILabel!
    public var totalPrice : Int!
    
    @IBOutlet weak var minusBtn: UIImageView!
    @IBOutlet weak var counterlbl: UILabel! // Counter label
    @IBOutlet weak var plusBtn: UIImageView!
    
    @IBOutlet var costLbl: UILabel! // Price label
    var foodCostLblC : String!
    
    @IBOutlet var foodNameLbl: UILabel!
    var foodNameLblC : String!
    
    @IBOutlet var foodDesc: UILabel!
    var foodId : Int!
    var counter = 0
    var name = ""
    
    var userName = "rustin_wilde"
    
    @IBOutlet var foodCategoryLbl: UILabel!
    var foodCategoryLblC : String!
    
    
    var food: Foods?
    
    var viewModel = DetailViewModel()
    
    var detailToCart = CartScreen()
    

    @IBOutlet var viewImage: UIView!
    @IBOutlet weak var viewDetail: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodNameLbl.text = foodNameLblC
        foodCategoryLbl.text = foodCategoryLblC
        costLbl.text = foodCostLblC
        configureImg()
        

        
        //Hide back button
        self.navigationItem.setHidesBackButton(true, animated: true)

        //Custom back button
        let backBtn = UIBarButtonItem(image: UIImage(named: "back4"), style: .done, target: self, action: #selector(goToBack))
         backBtn.imageInsets = UIEdgeInsets(top: 3, left: -12, bottom: 0, right: 0)
        backBtn.customView?.backgroundColor = .white
        
        //view corner radius
        let imgView = viewImage
        imgView?.layer.cornerRadius = 15.0
        imgView?.clipsToBounds = true
        imgView?.layer.masksToBounds = true
       
        //back button
         self.navigationItem.setLeftBarButton(backBtn, animated: true)

        //view top right and left corner radius
        viewDetail.layer.cornerRadius = 40
        viewDetail.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        let minusTap = UITapGestureRecognizer(target: self, action: #selector(minusImageTapped))
        minusBtn.addGestureRecognizer(minusTap)
        minusBtn.isUserInteractionEnabled = true
        
        let plusTap = UITapGestureRecognizer(target: self, action: #selector(plusImageTapped))
        plusBtn.addGestureRecognizer(plusTap)
        plusBtn.isUserInteractionEnabled = true
        
        counterlbl.text = "0"
        
        foodDesc.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque elementum dapibus sodales. Vestibulum tempus mi sit amet lorem pretium, in pellentesque lectus bibendum. Pellentesque vulputate, arcu at gravida consectetur, lectus sapien aliquet erat, ut porttitor purus nulla nec lorem."
        
        
     
    }
    

    
    func configureImg() {
        let url = URL(string: "http://kasimadalan.pe.hu/foods/images/" + (detailImageC ?? "0"))
        detailImage?.kf.setImage(with: url)
    }
    
    
    
    
    
    //go to previous screen
    @objc func goToBack () {
        _ = navigationController?.popViewController(animated: true)
    }
    

    
    //decrement
    
    @objc func minusImageTapped () {
           updateLabels(increment: false)
       }
    

    
    //increment
    
    @objc func plusImageTapped() {
           updateLabels(increment: true)
       }
    
    
    func updateLabels(increment: Bool) {
            // make sure Cost Per Item label has a string
            if let priceStr = costLbl.text {
                
                // make sure we get a valid Int
                if let priceInt = Int(priceStr) {

                    // if we tapped the minus image,
                    //  don't go lower than 1 item
                    if increment == false {
                        if counter > 1 {
                            counter -= 1
                        } else {
                            return
                        }
                    } else {
                        counter += 1
                    }
                    
                    counterlbl.text = "\(counter)"
                    
                    totalPrice = priceInt * counter
                    totalPricelbl.text = "Total: \(totalPrice!)"
        }
    }
}
    
    
    @IBAction func addToCartBtn(_ sender: Any) {
        if let name = foodNameLbl.text,  let price = costLbl.text, let category = foodCategoryLbl.text, let orderAmount = counterlbl.text {
            
            let totalP = Int(price)! * Int(orderAmount)!
           
            viewModel.insertToCart(name: name, image : detailImageC, price: totalP, category: category, orderAmount: Int(orderAmount)!, userName: userName)
            print(name)
            print(category)
            print(orderAmount)
            print(userName)
            print("\(price)$")
            
            
        }
    }
    
    

}


