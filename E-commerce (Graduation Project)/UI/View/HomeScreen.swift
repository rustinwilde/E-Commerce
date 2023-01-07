//
//  ViewController.swift
//  E-commerce (Graduation Project)
//
//  Created by Rustin Wilde on 22.12.22.
//

import UIKit
import Alamofire
import RxSwift
import Kingfisher



class HomeScreen: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var searchIcon: UIImageView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var foodsList = [Foods]()
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30 ) / 2
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth*1.5)
        
        collectionView.collectionViewLayout = layout
        
        
        
        let _ = viewModel.foodList.subscribe(onNext: { list in
            self.foodsList = list
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
        
        //Search Bar
        searchView.layer.cornerRadius = 25
        searchView.layer.shadowColor = UIColor.gray.cgColor
        searchView.layer.shadowOpacity = 0.2
        searchView.layer.shadowOffset = .zero
        searchView.layer.shadowRadius = 8
        searchIcon.image = UIImage(named: "search")?.withTintColor(.gray)
        

        
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadFoods()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               if segue.identifier == "toDetail" {
                   if let food = sender as? Foods {
                       let detailScreen = segue.destination as! DetailScreen
                       detailScreen.food = food
                   }
               }
           }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as? ShadowedCollectionViewCell
        
        
        cell!.configure(item: foodsList[indexPath.row])
        
            
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = foodsList[indexPath.row]
        
        let foodDetail : DetailScreen = self.storyboard?.instantiateViewController(withIdentifier: "DetailScreen") as! DetailScreen
        
        let costToStr = String(food.price!)
        
        foodDetail.foodId = foodsList[indexPath.row].id
        foodDetail.foodNameLblC = food.name
        foodDetail.foodCostLblC = costToStr
        foodDetail.foodCategoryLblC = food.category
        foodDetail.detailImageC = food.image
        
        self.navigationController?.pushViewController(foodDetail, animated: true)
        
    }
    
 
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 250)
    }
    
    }

extension HomeScreen : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Food search : \(searchText)")
    }
}

