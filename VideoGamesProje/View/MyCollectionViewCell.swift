//
//  MyCollectionViewCell.swift
//  VideoGamesProje
//
//  Created by Mansur Emin  Kaya on 25.11.2020.
//  Copyright © 2020 Mansur Emin  Kaya. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var resim: UIImageView?
    @IBOutlet weak var gameAd: UILabel?
    @IBOutlet weak var rating_released: UILabel?
    
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    /*
    public func configure(with image:UIImage){
        imageView.image=image
    }
    static func nib() -> UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
 */
}
