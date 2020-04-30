//
//  ProfileViewController.swift
//  ZoomerFit
//
//  Created by Andrew Kang on 4/30/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var profileID: UILabel!
    
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var uploadWorkout: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePicture.image = UIImage (named: "clarkfit.png")
        profileID.text = "placeholder UserID"
        
        // Do any additional setup after loading the view.
    }
    
 

    @IBAction func profileButtonTouched(_ sender: Any) {
        performSegue(withIdentifier: "", sender: self)
        
    }
    

    @IBAction func uploadButtonTouched(_ sender: Any) {
        performSegue(withIdentifier: "", sender: self)
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
