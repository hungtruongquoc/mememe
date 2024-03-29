//
//  CollectionViewCell.swift
//  MemeMe
//
//  Created by Hung Truong on 3/28/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var topLabel:UILabel
    var bottomLabel: UILabel
    @IBOutlet var image: UIImageView!
    
    override init(frame: CGRect) {
        // Initialize properties with default values
        self.topLabel = UILabel()
        self.bottomLabel = UILabel()
        self.image = UIImageView()

        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Initialize properties with default values
        self.topLabel = UILabel()
        self.bottomLabel = UILabel()
        self.image = UIImageView()
        
        super.init(coder: aDecoder)
    }
}
