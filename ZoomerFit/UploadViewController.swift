//
//  UploadViewController.swift
//  ZoomerFit
//
//  Created by Andrew Kang on 4/30/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit
import Firebase


class UploadViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var workoutDescription: UITextView!
    @IBOutlet weak var workoutName: UITextField!
    
    @IBOutlet weak var submitImage: UIButton!
    
    @IBOutlet weak var selectedMuscles: UITextField!
    @IBOutlet weak var submitVideo: UIButton!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var muscleSelector: UIPickerView!
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    var muscleGroups = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        // Get a reference to the storage service using the default Firebase App
        let storage = Storage.storage()
        muscleGroups = ["Back", "Arms", "Stomach", "Chest"]
        // Create a storage reference from our storage service
    }
    
    
    @IBAction func uploadWorkout(_ sender: Any) {
        let title = self.workoutName.text
        let muscleGroups = self.selectedMuscles.text
        let description = self.workoutDescription.text
        let coach = Auth.auth().currentUser
        let storageRef = Storage.storage().reference().child("workout/\(coach)/\(title)")
        
    }
    
    @IBAction func selectMuscles(_ sender: Any) {
        picker = UIPickerView.init()
        picker.delegate = self
        
        picker.dataSource=self
        picker.backgroundColor = UIColor.white
        picker.setValue(UIColor.black, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)

        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = UIBarStyle.black
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)

    }
    
   
    
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return muscleGroups.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(muscleGroups[row])
        self.selectedMuscles.text = muscleGroups[row]
        return (muscleGroups[row])
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(muscleGroups[row])
    }
}
