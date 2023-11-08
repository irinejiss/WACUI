//
//  BannerCollectionViewCell.swift
//  WAC1
//
//  Created by Irine on 07/11/23.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var bannerImg: UIImageView!
    
    var bannerIndex: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
         func styleUI() {
            bannerImg.contentMode = .scaleAspectFill
        }
    }
}
