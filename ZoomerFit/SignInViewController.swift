//
//  ViewController.swift
//  ZoomerFit
//
//  Created by Andrew Kang on 4/26/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit
import FirebaseUI
import FBSDKLoginKit
import Firebase

class ViewController: UIViewController, LoginButtonDelegate {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let loginButton = FBLoginButton()
        loginButton.delegate = self
        loginButton.center = view.center
        view.addSubview(loginButton)
        loginButton.permissions = ["public_profile", "email"]
        if let token = AccessToken.current,
            !token.isExpired {
            firebaseFBLogin(accessToken: AccessToken.current!.tokenString)
        }

        // Do any additional setup after loading the view.
    }
    
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
    }
    
    func loginButton(_ loginButton: FBLoginButton!, didCompleteWith result: LoginManagerLoginResult!, error: Error!) {
      if let error = error {
        print(error.localizedDescription)
        return
      }
    }
    
    func firebaseFBLogin(accessToken: String) {
        let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
        Auth.auth().signInAndRetrieveData(with: credential, completion: {(authResult, error) in
            if let error = error {
                print("Firebase Login Error")
                print(error)
                return
            }
            print("Firebase Login Done")
            print(authResult)
            if let user = Auth.auth().currentUser {
                print("current firebase user is")
                print(user)
            }
        })
        performSegue(withIdentifier: "toTab", sender: self)
    }

    @IBAction func SignInPressed(_ sender: Any) {
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
            return
        }
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]
        let authViewController = authUI?.authViewController()
        present(authViewController!, animated: true, completion: nil)
    }
    
}



extension ViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        guard error == nil else {
            print(error?.localizedDescription as Any)
            return
        }
        //authDataResult?.user.uid
        //performSegue(withIdentifier: "goHome", sender: self)
        performSegue(withIdentifier: "toTab", sender: self)
    }
}


