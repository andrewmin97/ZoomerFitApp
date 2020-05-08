//
//  HomeCollectionViewCell.swift
//  ZoomerFit
//
//  Created by Joshua Jun on 5/7/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var homeTitleLabel: UILabel!
    
    var home: Home! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if let home = home {
            featuredImageView.image = home.featuredImage
            homeTitleLabel.text = home.title
            backgroundColorView.backgroundColor = home.color
            
        }
        else {
            featuredImageView.image = nil
            homeTitleLabel.text = nil
            backgroundColorView.backgroundColor = nil
        }
        
        backgroundColorView.layer.cornerRadius = 10.0
        backgroundColorView.layer.masksToBounds = true
        featuredImageView.layer.cornerRadius = 10.0
        featuredImageView.layer.masksToBounds = true
    }
}
