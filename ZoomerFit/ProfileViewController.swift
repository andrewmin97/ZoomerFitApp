//
//  ProfileViewController.swift
//  ZoomerFit
//
//  Created by Andrew Kang on 4/30/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit
import Firebase
import QuartzCore

class ProfileViewController: UIViewController {


    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var tapToChangeProfileButton: UIButton!
    var imagePicker:UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let user = Auth.auth().currentUser
        self.UserName.text = user?.displayName
        guard let uid = Auth.auth().currentUser?.uid else { return}
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        // Load the image using SDWebImage
        let placeholderImage = UIImage(named: "placeholder_profile.png")
        profileImageView.sd_setImage(with: storageRef, placeholderImage: placeholderImage)
//        profileImageView.layer.borderWidth = 1
//        profileImageView.layer.masksToBounds = false
//        profileImageView.layer.borderColor = UIColor.black.cgColor
//        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
//        profileImageView.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeProfile(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func uploadProfileImage(_ image:UIImage, completion: @escaping ((_ url:URL?)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return}
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        guard let imageData = image.jpegData(compressionQuality: 0.75) else {return}
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        let uploadTask = storageRef.putData(imageData, metadata: metaData) { (metadata, error) in
          guard let metadata = metadata else {
            // Uh-oh, an error occurred!
            return
          }
          // Metadata contains file metadata such as size, content-type.
          let size = metadata.size
          // You can also access to download URL after upload.
          storageRef.downloadURL { (url, error) in
            guard let downloadURL = url else {
              // Uh-oh, an error occurred!
              return
            }
          }
        }
        
    }
    
    func saveProfile(profileImageURL: URL, completion: @escaping ((_ success:Bool)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return}
        let databaseRef = Database.database().reference().child("users/profile/\(uid)")
        let userObject = ["photoURL": profileImageURL.absoluteString] as [String:Any]
        databaseRef.setValue(userObject) { error, ref in
            completion(error == nil)
        }
        
    }
    
    

    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.profileImageView.image = pickedImage
            self.uploadProfileImage(pickedImage) { url in
                if url != nil {
                    let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                    changeRequest?.photoURL = url
                    
                    changeRequest?.commitChanges { error in
                        if error == nil {
                            print("User Profile Pic changed")
                            self.saveProfile(profileImageURL: url!) { success in
                                if success {
                                    self.dismiss(animated: true, completion: nil)
                                }
                            
                            }
                        } else {
                            print("error")
                        }
                    }
                    
                }
                else {
                    
                }
                
                
            }
            
        }
        picker.dismiss(animated: true, completion: nil)
    }
}


