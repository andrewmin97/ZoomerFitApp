//
//  BackViewController.swift
//  ZoomerFit
//
//  Created by Joshua Jun on 5/3/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit
import Firebase


class BackViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView:UITableView!
    
    var backArray = [Health]()
    var selectedWorkout = Health()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }
    
    func getData()
    {
        let db = Firestore.firestore()
        _ = muscleName
        db.collection("Workouts").whereField("muscleGroups", isEqualTo: muscleName).getDocuments { (snapshot, error) in
            
            if error != nil || snapshot == nil
            {
                if error != nil
                {
                    print("error: " + error!.localizedDescription)
                }
                else
                {
                    print("No Back Info")
                }
                
            }
            else
            {
                self.backArray.removeAll()
                
                
                for document in snapshot!.documents
                {
                    let documentID = document.documentID
                    
//                    self.documentIDArray.append(documentID as NSString)
                    
                    let documentData = document.data()
                    
                    let health1 = Health()
                    health1.title = documentData["title"] as! String
                    health1.coach = documentData["coach"] as! String
                    health1.desc = documentData["description"] as! String
                    health1.muscleGroup = documentData["muscleGroups"] as! String
                    health1.imgURL = documentData["photoURL"] as! String
                    
                    self.backArray.append(health1)
                    
//                    self.backArray.append(documentData as NSDictionary)
                    
                    print("documentData = ", documentData)
                }
                
                self.tableView.reloadData()
            }
                
        }
    }
    
    func downloadImage(url: String) -> UIImage
    {
        /*
        let dbRef = database.reference().child("myFiles")
        dbRef.observeEventType(.ChildAdded, withBlock: { (snapshot) in
          // Get download URL from snapshot
          let downloadURL = snapshot.value() as! String
          // Create a storage reference from the URL
          let storageRef = storage.referenceFromURL(downloadURL)
          // Download the data, assuming a max size of 1MB (you can change this as necessary)
          storageRef.dataWithMaxSize(1 * 1024 * 1024) { (data, error) -> Void in
            // Create a UIImage, add it to the array
            let pic = UIImage(data: data)
            picArray.append(pic)
          })
        })
        */
        
        var myImage: UIImage = UIImage(named: "carousel1.png")!
        
        let reference = Storage.storage().reference(withPath: url)
        reference.getData(maxSize: (10 * 1024 * 1024)) { (data, error) in
            if let _error = error{
                print(_error)
                
            } else {
                if let _data  = data {
                    myImage = UIImage(data: _data)!
                    
//                    return UIImage(data: _data)
                }
                else
                {
                    
                }
            }
        }
        
        return myImage
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return backArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"BasicCell", for: indexPath)
        
        let titleLabel = cell.viewWithTag(1) as! UILabel //tags are not resusable
        //could create customize ui table  view cell class
        titleLabel.text = backArray[indexPath.row].title
        
        let imageView = cell.viewWithTag(2) as! UIImageView
        
        let reference = Storage.storage().reference(withPath: backArray[indexPath.row].imgURL)
                reference.getData(maxSize: (10 * 1024 * 1024)) { (data, error) in
                    if let _error = error{
                        print(_error)
                        imageView.image = UIImage(named: "carousel1.png")
                    } else {
                        if let _data  = data {
                            imageView.image = UIImage(data: _data)!
                        }
                        else
                        {
                            imageView.image = UIImage(named: "carousel1.png")
                        }
                    }
                }
        
//        imageView.image = downloadImage(url: backArray[indexPath.row].imgURL)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(self.backArray[indexPath.row].title)
            selectedWorkout = self.backArray[indexPath.row]
            performSegue(withIdentifier: "toWorkout2", sender: nil) //your segue identifier here

        }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Create a variable that you want to send
            let workout = selectedWorkout
            // Create a new variable to store the instance of PlayerTableViewController
            let destinationVC = segue.destination as! WorkoutViewController
            destinationVC.workoutObject = workout
        }
            

}
