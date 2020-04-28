//
//  ViewController.swift
//  ZoomerFit
//
//  Created by Andrew Kang on 4/26/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit
import FirebaseUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        performSegue(withIdentifier: "goHome", sender: self)
        
    }
}


