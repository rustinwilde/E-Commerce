//
//  ProductsTableViewCell.swift
//  E-commerce (Graduation Project)
//
//  Created by Rustin Wilde on 29.12.22.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet var productImageCart: UIImageView!
    
    @IBOutlet var productNameCart: UILabel!
    
    @IBOutlet var productCategory: UILabel!
    @IBOutlet var productAmountCart: UILabel!
    
    
    @IBOutlet var productTotalPrice: UILabel!
    @IBOutlet var userName: UILabel!
    
    @IBOutlet var viewCart: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        viewCart.layer.cornerRadius = 8.0
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    func configure(item : FoodsCart) {
        
        let url = URL(string: "http://kasimadalan.pe.hu/foods/images/" + item.image)
        productImageCart.kf.setImage(with: url)
        productNameCart.text = item.name
        productCategory.text = item.category
        productTotalPrice.text = "\(item.price)$"
        productAmountCart.text = String(item.orderAmount)
        
        
    }
    
    
}

