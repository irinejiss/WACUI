//
//  CategoryCollectionViewCell.swift
//  WAC1
//
//  Created by Irine on 07/11/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
         func styleUI() {
//            imageView.layer.borderWidth = 0.2
             imageView.layer.borderColor = .none
//            imageView.layer.cornerRadius = self.frame.height/2
             self.imageView.layer.cornerRadius = self.imageView.bounds.height/2
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
        }
    }
    
}
