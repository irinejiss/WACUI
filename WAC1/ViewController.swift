//
//  ViewController.swift
//  WAC1
//
//  Created by Irine on 07/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    var category1 = [Category]()
    var banner = [Category]()
    let viewModel = ViewModel()
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCategory { [weak self] (data) in
            self?.category1 = data
            DispatchQueue.main.async {
                self?.categoryCollectionView.reloadData()
            }
        }
        
        viewModel.fetchBanners{ [weak self] (data) in
            self?.banner = data
            DispatchQueue.main.async {
                self?.bannerCollectionView.reloadData()
            }
        }
    }
    
    
    private func reloadUI() {
        self.categoryCollectionView.reloadData()
        self.bannerCollectionView.reloadData()
        
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return self.category1.count
        } else {
            return self.banner.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            return CGSize(width: 20, height: 20)
        } else {
            return CGSize(width: 220, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            let categoryCell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionViewCell
            categoryCell.categoryLabel.text = category1[indexPath.row].name
            categoryCell.index = indexPath
            if let url = URL(string: category1[indexPath.row].image ?? "") {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    
                    DispatchQueue.main.async { /// execute on main thread
                        categoryCell.imageView.image = UIImage(data: data)
                    }
                }
                
                task.resume()
            }
            return categoryCell
        } else {
            let bannerCell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "banner", for: indexPath) as! BannerCollectionViewCell
            
            bannerCell.bannerIndex = indexPath
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
                
            }
            if let url = URL(string: banner[indexPath.row].image ?? "") {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    
                    DispatchQueue.main.async { /// execute on main thread
                        bannerCell.bannerImg.image = UIImage(data: data)
                    }
                }
                
                task.resume()
            }
            return bannerCell
        }
    }
}


