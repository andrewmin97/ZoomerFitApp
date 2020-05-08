//
//  WelcomeViewController.swift
//  ZoomerFit
//
//  Created by Andrew Kang on 4/30/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//


import UIKit

class WelcomeViewController : UIViewController
{
    @IBOutlet weak var collectionView: UICollectionView!
    var home = Home.fetchHome()
    
    override func viewDidLoad() {
        
        collectionView.dataSource = self
    }
    
}

extension WelcomeViewController: UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return home.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        let hom = home[indexPath.item]
        
        cell.home = hom
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                layout collectionViewLayout: UICollectionViewLayout,
                                sizeForItemAt indexPath: IndexPath) -> CGSize {

      return CGSize(width: 200, height: 400)
     
    }
}
