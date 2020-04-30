//
//  WelcomeViewController.swift
//  ZoomerFit
//
//  Created by Andrew Kang on 4/30/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    
    @IBOutlet weak var popularityChart: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // eventImage.image = UIImage (named: "carousel1.png")
        
     //   popularityChart.image = UIImage(named: "popularitychart.png")
//        
        //self.welcomeLabel.text = "Welcome!"
        
        // Do any additional setup after loading the view.
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
