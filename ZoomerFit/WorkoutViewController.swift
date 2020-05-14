//
//  WorkoutViewController.swift
//  ZoomerFit
//
//  Created by Andrew Kang on 5/2/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit
import Firebase

class WorkoutViewController: UIViewController {
//Seg bar
    
    @IBOutlet weak var segcontrolBar: UISegmentedControl!
//Display for Sets

    @IBOutlet weak var equipmentHeaderLabel: UILabel!
    
    @IBOutlet weak var equipmentLabel: UILabel!
    
    @IBOutlet weak var durationHeaderLabel: UILabel!
   
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var detailsHeaderLabel: UILabel!
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    //Display for Description
    @IBOutlet weak var descriptionImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var workoutName: UILabel!
    var workoutObject = Health()
    
//Methods
//viewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.workoutName.text = workoutObject.title

 segcontrolBar.selectedSegmentIndex = 0
    //hide set info
        equipmentLabel.isHidden = true;
        equipmentHeaderLabel.isHidden = true;
        equipmentLabel!.layer.cornerRadius = 6;
        equipmentLabel!.layer.borderColor = UIColor.black.cgColor;
        equipmentLabel!.layer.borderWidth = 1;
        durationHeaderLabel.isHidden = true;
        durationLabel.isHidden = true;
        durationLabel!.layer.cornerRadius = 6;
        durationLabel!.layer.borderColor = UIColor.black.cgColor;
        durationLabel!.layer.borderWidth = 1;
        detailsHeaderLabel.isHidden = true;
        detailsLabel.isHidden = true;
        detailsLabel!.layer.cornerRadius = 6;
        detailsLabel!.layer.borderColor = UIColor.black.cgColor;
        detailsLabel!.layer.borderWidth = 1;

        //memoText!.layer.borderWidth = 1;
        //memoText!.layer.borderColor = UIColor.black.cgColor;
        //memoText!.layer.cornerRadius = 6;

        segcontrolBar.isHidden = false;
    //description segue info
        let reference = Storage.storage().reference(withPath: workoutObject.imgURL)
        let placeholderImage = UIImage(named: "placeholder_profile.png")
        descriptionImage.sd_setImage(with: reference, placeholderImage: placeholderImage)

        descriptionLabel.numberOfLines = 0;
        //get text from database
        descriptionLabel.text = workoutObject.desc;
        detailsLabel.text = workoutObject.detailed;
        equipmentLabel.text = workoutObject.equipment;
        durationLabel.text = workoutObject.length;
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func segControlChanged(_ sender: UISegmentedControl) {
        //UISegmentedControl seg = sender;
        if (segcontrolBar.selectedSegmentIndex == 0){
            descriptionImage.isHidden = false;
            descriptionLabel.isHidden = false;
           
            equipmentHeaderLabel.isHidden = true;
            equipmentLabel.isHidden = true;
            durationHeaderLabel.isHidden = true;
            durationLabel.isHidden = true;
            detailsHeaderLabel.isHidden = true;
            detailsLabel.isHidden = true;

        } //outside seg 0
        else if (segcontrolBar.selectedSegmentIndex == 1){
            descriptionImage.isHidden = true;
            descriptionLabel.isHidden = true;
            equipmentHeaderLabel.isHidden = false;
            equipmentLabel.isHidden = false;
            durationHeaderLabel.isHidden = false;
            durationLabel.isHidden = false;
            detailsHeaderLabel.isHidden = false;
            detailsLabel.isHidden = false;
        }//outside seg 1
            
        else if (segcontrolBar.selectedSegmentIndex == 2){
            descriptionImage.isHidden = true;
            descriptionLabel.isHidden = true;
            equipmentHeaderLabel.isHidden = false;
            equipmentLabel.isHidden = false;
            durationHeaderLabel.isHidden = false;
            durationLabel.isHidden = false;
            detailsHeaderLabel.isHidden = false;
            detailsLabel.isHidden = false;
        }//outside seg 2
            
        else if (segcontrolBar.selectedSegmentIndex == 3){
            descriptionImage.isHidden = true;
            descriptionLabel.isHidden = true;
            equipmentHeaderLabel.isHidden = false;
            equipmentLabel.isHidden = false;
            durationHeaderLabel.isHidden = false;
            durationLabel.isHidden = false;
            detailsHeaderLabel.isHidden = false;
            detailsLabel.isHidden = false;

        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true);
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
