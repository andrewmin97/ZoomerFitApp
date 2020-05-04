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
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var repLabel: UILabel!
    @IBOutlet weak var repText: UITextField!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var durationText: UITextField!
    @IBOutlet weak var memoLabel: UILabel!
    @IBOutlet weak var memoText: UITextView!
//Buttons
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
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
        print(workoutObject.desc)
        print(workoutObject.imgURL)
    //initialize to description
        //check for data in database.
        //if empty,
        memoText.text = "Write down any notes for yourself here!";
        memoText.textColor = UIColor.lightGray;
    //these should be pulled from database
        //weightText.text = "";
        //repText.text = "";
        //durationText.text = "";
        segcontrolBar.selectedSegmentIndex = 0
    //hide set info
        weightLabel.isHidden = true;
        weightText.isHidden = true;
        repLabel.isHidden = true;
        repText.isHidden = true;
        durationLabel.isHidden = true;
        durationText.isHidden = true;
        memoLabel.isHidden = true;
        memoText.isHidden = true;
        memoText!.layer.borderWidth = 1;
        memoText!.layer.borderColor = UIColor.black.cgColor;
        memoText!.layer.cornerRadius = 6;
        saveButton.isHidden = true;
        clearButton.isHidden = true;
        segcontrolBar.isHidden = true;t
    //description segue info
        let reference = Storage.storage().reference(withPath: workoutObject.imgURL)
        let placeholderImage = UIImage(named: "placeholder_profile.png")
        descriptionImage.sd_setImage(with: reference, placeholderImage: placeholderImage)

        descriptionLabel.numberOfLines = 0;
        //get text from database
        descriptionLabel.text = workoutObject.desc
        // Do any additional setup after loading the view.
    }
    

    @IBAction func segControlChanged(_ sender: UISegmentedControl) {
        //UISegmentedControl seg = sender;
        if (segcontrolBar.selectedSegmentIndex == 0){
            descriptionImage.isHidden = false;
            descriptionLabel.isHidden = false;
            weightLabel.isHidden = true;
            weightText.isHidden = true;
            repLabel.isHidden = true;
            repText.isHidden = true;
            durationLabel.isHidden = true;
            durationText.isHidden = true;
            memoLabel.isHidden = true;
            memoText.isHidden = true;
            saveButton.isHidden = true;
            clearButton.isHidden = true;
        } //outside seg 0
        else if (segcontrolBar.selectedSegmentIndex == 1){
                //check for data in database.
                //if empty,
                memoText.text = "Write down any notes for yourself here!";
                memoText.textColor = UIColor.lightGray;
            //these should be pulled from database
                //weightText.text = "";
                //repText.text = "";
                //durationText.text = "";
            
            descriptionImage.isHidden = true;
            descriptionLabel.isHidden = true;
            weightLabel.isHidden = false;
            weightText.isHidden = false;
            repLabel.isHidden = false;
            repText.isHidden = false;
            durationLabel.isHidden = false;
            durationText.isHidden = false;
            memoLabel.isHidden = false;
            memoText.isHidden = false;
            saveButton.isHidden = false;
            clearButton.isHidden = false;
        }//outside seg 1
        else if (segcontrolBar.selectedSegmentIndex == 2){
                //check for data in database.
                //if empty,
                memoText.text = "Write down any notes for yourself here!";
                memoText.textColor = UIColor.lightGray;
            //these should be pulled from database
                //weightText.text = "";
                //repText.text = "";
                //durationText.text = "";
            
            descriptionImage.isHidden = true;
            descriptionLabel.isHidden = true;
            weightLabel.isHidden = false;
            weightText.isHidden = false;
            repLabel.isHidden = false;
            repText.isHidden = false;
            durationLabel.isHidden = false;
            durationText.isHidden = false;
            memoLabel.isHidden = false;
            memoText.isHidden = false;
            saveButton.isHidden = false;
            clearButton.isHidden = false;
        }//outside seg 2
        else if (segcontrolBar.selectedSegmentIndex == 3){
                //check for data in database.
                //if empty,
                memoText.text = "Write down any notes for yourself here!";
                memoText.textColor = UIColor.lightGray;
            //these should be pulled from database
                //weightText.text = "";
                //repText.text = "";
                //durationText.text = "";
            
            descriptionImage.isHidden = true;
            descriptionLabel.isHidden = true;
            weightLabel.isHidden = false;
            weightText.isHidden = false;
            repLabel.isHidden = false;
            repText.isHidden = false;
            durationLabel.isHidden = false;
            durationText.isHidden = false;
            memoLabel.isHidden = false;
            memoText.isHidden = false;
            saveButton.isHidden = false;
            clearButton.isHidden = false;
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true);
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        //this should save all data in current textboxes to array of corresponding seg
        
        
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        weightText.text = "";
        repText.text = "";
        durationText.text = "";
        memoText.text = "";
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
