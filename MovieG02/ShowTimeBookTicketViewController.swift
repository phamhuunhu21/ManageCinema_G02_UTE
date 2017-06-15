//
//  ShowTimeBookTicketViewController.swift
//  MovieG02
//
//  Created by Pham Huu Nhu on 6/15/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import Firebase

class ShowTimeBookTicketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var passedDataIdMovie2:String!
    var passedDataDate:String!
    var passedDataCinema2:String!
    var ref: DatabaseReference!
    var listTime = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        getDataTime()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell") as! TimeTableViewCell
        cell.timeLabel.text = listTime[indexPath.row]
        
        return cell
    }
    
    func getDataTime() {
        self.listTime = [String]()
        if (passedDataDate != nil && passedDataIdMovie2 != nil && passedDataCinema2 != nil) {
            ref.child("TimeBook").child(passedDataIdMovie2).child(passedDataCinema2).child(passedDataDate).observeSingleEvent(of: .value, with: { (snapshot) in
                if let value = snapshot.value as? [String: AnyObject] {
                    let time1 = value["time1"] as? String ?? ""
                    self.listTime.append(time1)
                    let time2 = value["time2"] as? String ?? ""
                    self.listTime.append(time2)
                    let time3 = value["time3"] as? String ?? ""
                    self.listTime.append(time3)
                    let time4 = value["time4"] as? String ?? ""
                    self.listTime.append(time4)
                    let time5 = value["time5"] as? String ?? ""
                    self.listTime.append(time5)
                    let time6 = value["time6"] as? String ?? ""
                    self.listTime.append(time6)
                    let time7 = value["time7"] as? String ?? ""
                    self.listTime.append(time7)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            })
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
