//
//  CoachDetailViewController.swift
//  ZoomerFit
//
//  Created by Joshua Jun on 5/8/20.
//  Copyright © 2020 Andrew Kang. All rights reserved.
//

import UIKit
import Firebase


class CoachDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!
    
    var coachWorkoutArray = [Health]()
    
    var selectedCoach = ""
    
    var selectedHealth = Health()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        if selectedCoach != ""
        {
            getData()
            
        }
        
    }
    
    func getData()
    {
        let db = Firestore.firestore()
        
        db.collection("Workouts").whereField("coachName", isEqualTo: selectedCoach).getDocuments { (snapshot, error) in
            
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
                self.coachWorkoutArray.removeAll()
                
                
                for document in snapshot!.documents
                {
//                    let documentID = document.documentID
                    
                    let documentData = document.data()
                    
                    
                    
                    let health1 = Health()
                    health1.title = documentData["title"] as! String
                    health1.coach = documentData["coach"] as! String
                    health1.desc = documentData["description"] as! String
                    health1.muscleGroup = documentData["muscleGroups"] as! String
                    health1.imgURL = documentData["photoURL"] as! String
                if((documentData["detailedDescription"]) != nil){
                    health1.detailed =  documentData["detailedDescription"] as! String
                }
                else{
                    health1.detailed = "Not given";
                }
                if((documentData["equipment"]) != nil){
                    health1.equipment =  documentData["equipment"] as! String
                }
                else{
                    health1.equipment = "Not given";
                }
                if((documentData["workoutLength"]) != nil){
                    health1.length =  documentData["workoutLength"] as! String
                }
                else{
                    health1.length = "Not given";
                }
                    
                    self.coachWorkoutArray.append(health1)
                    
                    print("documentData = ", documentData)
                }
                
                self.tableView.reloadData()
            }
                
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coachWorkoutArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        
        let coachLabel = cell.viewWithTag(1) as! UILabel
        coachLabel.text = coachWorkoutArray[indexPath.row].title
        
        let imageView = cell.viewWithTag(2) as! UIImageView
        
        
        
        let reference = Storage.storage().reference(withPath: coachWorkoutArray[indexPath.row].imgURL)
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
        
        selectedHealth = coachWorkoutArray[indexPath.row]
        
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let workoutDetail = segue.destination as! WorkoutViewController
        
        workoutDetail.workoutObject = selectedHealth
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
