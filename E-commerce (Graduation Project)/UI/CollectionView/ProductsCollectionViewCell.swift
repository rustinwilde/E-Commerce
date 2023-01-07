//
//  ProductsCollectionViewCell.swift
//  E-commerce (Graduation Project)
//
//  Created by Rustin Wilde on 24.12.22.
//

import UIKit
import Kingfisher

class ShadowedCollectionViewCell: UICollectionViewCell {
    
    let roundedCornerView = UIView()

    let productImg = UIImageView()
    let productName = UILabel()
    let productCategory = UILabel()
    let productPrice = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    func commonInit() {
        contentView.backgroundColor = .white
        roundedCornerView.backgroundColor = .white
        roundedCornerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(roundedCornerView)
        
        let g = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            roundedCornerView.topAnchor.constraint(equalTo: g.topAnchor, constant: 8.0),
            roundedCornerView.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 1.0),
            roundedCornerView.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -1.0),
            roundedCornerView.bottomAnchor.constraint(equalTo: g.bottomAnchor, constant: -8.0),
        ])
        
        roundedCornerView.layer.cornerRadius = 30.0
        
        roundedCornerView.layer.shadowRadius = 6.0
        roundedCornerView.layer.shadowColor = UIColor.gray.cgColor
        roundedCornerView.layer.shadowOpacity = 0.2
        roundedCornerView.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        
        // add labels, imageView, etc to roundedView
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        productImg.contentMode = .scaleAspectFit
        
        productImg.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        roundedCornerView.addSubview(productImg)
        roundedCornerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([

            productImg.topAnchor.constraint(equalTo: roundedCornerView.topAnchor, constant: 8.0),
            productImg.leadingAnchor.constraint(equalTo: roundedCornerView.leadingAnchor, constant: 16.0),
            productImg.trailingAnchor.constraint(equalTo: roundedCornerView.trailingAnchor, constant: -16.0),
            productImg.heightAnchor.constraint(equalTo: productImg.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: productImg.bottomAnchor, constant: 8.0),
            stackView.leadingAnchor.constraint(equalTo: roundedCornerView.leadingAnchor, constant: 8.0),
            stackView.trailingAnchor.constraint(equalTo: roundedCornerView.trailingAnchor, constant: -8.0),
            stackView.bottomAnchor.constraint(equalTo: roundedCornerView.bottomAnchor, constant: -16.0),

        ])

        productName.textAlignment = .center
        productCategory.textAlignment = .center
        productPrice.textAlignment = .center

        productName.font = .systemFont(ofSize: 12, weight: .light)
        productCategory.font = .systemFont(ofSize: 10, weight: .light)
        productPrice.font = .systemFont(ofSize: 12, weight: .light)

        productCategory.textColor = .gray
        
        stackView.addArrangedSubview(productName)
        stackView.addArrangedSubview(productCategory)
        stackView.addArrangedSubview(productPrice)

    }
    
    func configure(item : Foods) {
        
        let url = URL(string: "http://kasimadalan.pe.hu/foods/images/" + item.image!)
        productImg.kf.setImage(with: url)
        productName.text = item.name
        productCategory.text = item.category
        productPrice.text = "\(item.price ?? 0)$"
        
    }
    
}
    
   

  
        
      




    
  


