//
//  WorkoutViewController.swift
//  ZoomerFit
//
//  Created by Andrew Kang on 5/2/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit

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
    
//Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //initialize to description
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
    //description segue info
        descriptionImage.image = UIImage (named: "arms.png"); //need to get image from database
        descriptionLabel.numberOfLines = 0;
        //get text from database
        descriptionLabel.text = "asdjhshjghvjgeshvgsehvjgshjvegvhawjehgfvahsgdvfahgfvMSHADbvEHGfvHSEGvfHSGEvfhGEfhmSGEFvmhSGEvfhsmgfvMSHBDvfHEGSfMSHDB vmEGHSfMSVHDvfehgmsfMSBDvfmHSGEfcmHDGfvHMGSEfgeHGHghcFEGCFgcfefjnsjskgsrbjkgrsbjkgrsbjkgrsbjkgrsbjkgrsbjkgrsbjgrsbbggksjrbgksjrbksjgbksrjgbksjrbgksjasdjhshjghvjgeshvgsehvjgshjvegvhawjehgfvahsgdvfahgfvMSHADbvEHGfvHSEGvfHSGEvfhGEfhmSGEFvmhSGEvfhsmgfvMSHBDvfHEGSfMSHDB vmEGHSfMSVHDvfehgmsfMSBDvfmHSGEfcmHDGfvHMGSEfgeHGHghcFEGCFgcfefjnsjskgsrbjkgrsbjkgrsbjkgrsbjkgrsbjkgrsbjkgrsbjgrsbbggksjrbgksjrbksjgbksrjgbksjrbgksjasdjhshjghvjgeshvgsehvjgshjvegvhawjehgfvahsgdvfahgfvMSHADbvEHGfvHSEGvfHSGEvfhGEfhmSGEFvmhSGEvfhsmgfvMSHBDvfHEGSfMSHDB vmEGHSfMSVHDv fehgmsfMSBDvfmHSGEfcmHDGfvHMGSEfgeHGHghcFEGCFgcfefjnsjskgsrbjkgrsbjkgrsbjkgrsbjkgrsbjkgrsbjkgrsbjgrsbbggksjrbgksjrbksjgbksrjgbksjrbgksjasdjhshjghvjgeshvgsehvjgshjvegvhawjehgfvahsgdvfahgfvMSHADbvEHGfvHSEGvfHSGEvfhGEfhmSGEFvmhSGEvfhsmgfvMSHBDvfHEGSfMSHDB vmEGHSfMSVHDv fehgmsfMSBDvfmHSGEfcmHDGfvHMGSEfgeHGHghcFEGCFgcfefjnsjskgsrbjkgrsbjkgrsbjkgrsbjkgrsbjkgrsbjkgrsbjgrsbbggksjrbgksjrbksjgbksrjgbksjrbgksj"
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
