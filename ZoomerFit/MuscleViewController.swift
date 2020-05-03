//
//  MuscleViewController.swift
//  ZoomerFit
//
//  Created by Andrew Kang on 5/3/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit
var muscleName = ""
class MuscleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonTouched(_ sender: Any) {
        muscleName = "Back"
    }
    
    @IBAction func armsButtonTouched(_ sender: Any) {
        muscleName = "Arms"
    }
    @IBAction func stomachButtonTouched(_ sender: Any) {
        muscleName = "Stomach"
    }
    @IBAction func chestButtonPressed(_ sender: Any) {
        muscleName = "Chest"
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
