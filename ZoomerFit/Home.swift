//
//  Home.swift
//  ZoomerFit
//
//  Created by Joshua Jun on 5/7/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit

class Home
{
    var title = ""
    var featuredImage: UIImage
    var color: UIColor
    
    init(title: String, featuredImage: UIImage, color: UIColor)
    {
        self.title = title
        self.featuredImage = featuredImage
        self.color = color
    }
    
    
    static func fetchHome() -> [Home]
    {
        return [
            Home(title: "Brand New App", featuredImage: UIImage(named: "f1")!, color: UIColor(red: 95/255.0, green: 105/255.0, blue: 122/255.0, alpha: 0.8)),
            Home(title: "Improve Yourself", featuredImage: UIImage(named: "f2")!, color: UIColor(red: 95/255.0, green: 105/255.0, blue: 122/255.0, alpha: 0.8)),
            Home(title: "Just Do It", featuredImage: UIImage(named: "f3")!, color: UIColor(red: 95/255.0, green: 105/255.0, blue: 122/255.0, alpha: 0.8)),
        
        ]
    }
    
    
}
