//
//  CoachViewController.swift
//  ZoomerFit
//
//  Created by Joshua Jun on 5/8/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit
import Firebase

class CoachViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView:UITableView!
    
    var coachArray = [String]()
    
    var selectedCoach = ""

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
        
        db.collection("Workouts").getDocuments { (snapshot, error) in
            
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
                self.coachArray.removeAll()
                
                
                for document in snapshot!.documents
                {
//                    let documentID = document.documentID
                    
                    let documentData = document.data()
                    
                    let coach = documentData["coach"] as! String
                    
                    var bool = false
                    
                    for i in 0 ..< self.coachArray.count
                    {
                        if self.coachArray[i] == coach
                        {
                            bool = true
                        }
                    }
                    
                    if bool == false
                    {
                        self.coachArray.append(coach)
                    }
                    
                    print("documentData = ", documentData)
                }
                
                self.tableView.reloadData()
            }
                
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coachArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        
        let coachLabel = cell.viewWithTag(1) as! UILabel
        coachLabel.text = coachArray[indexPath.row]
        
        let imageView = cell.viewWithTag(2) as! UIImageView
        
        let coachUID = coachArray[indexPath.row]
        
        let reference = Storage.storage().reference(withPath: "user/\(coachUID)")
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
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCoach = coachArray[indexPath.row]
        
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let coachDetail = segue.destination as! CoachDetailViewController
        
        coachDetail.selectedCoach = selectedCoach
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
