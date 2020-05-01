//
//  ProfileViewController.swift
//  ZoomerFit
//
//  Created by Andrew Kang on 4/30/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {


    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var tapToChangeProfileButton: UIButton!
    var imagePicker:UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeProfile(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.profileImageView.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}


