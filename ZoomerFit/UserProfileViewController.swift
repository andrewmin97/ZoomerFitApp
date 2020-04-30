//
//  UserProfileViewController.swift
//  ZoomerFit
//
//  Created by Andrew Kang on 4/30/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var backArrow: UIButton!
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userDescription: UITextView!
    
    @IBOutlet weak var profileTable: UITableView!
    
    @IBOutlet weak var tableThumbnail: UITableViewCell!
    
    @IBOutlet weak var tableDescription: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.image = UIImage (named: "clarkfit.jpg")
        // Do any additional setup after loading the view.
    }
    @IBAction func backArrowPressed(_ sender: Any) {
        //performSegue(withIdentifier: "", sender: self)
        
        //[self dismissViewControllerAnimated:YES completion:nil];
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
