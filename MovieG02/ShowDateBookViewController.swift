//
//  ShowDateBookViewController.swift
//  MovieG02
//
//  Created by Pham Huu Nhu on 6/15/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import Firebase

class ShowDateBookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var passedDataCinema: String!
    var passedDateIdMovie: String!
    var ref: DatabaseReference!
    var listDate = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        getDataDate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDataDate() {
        self.listDate = [String]()
        if (passedDataCinema != nil && passedDateIdMovie != nil) {
            ref.child("DateBook").child(passedDateIdMovie).child(passedDataCinema).observeSingleEvent(of: .value, with: { (snapshot) in
                if let value = snapshot.value as? [String: AnyObject] {
                    let date1 = value["date1"] as? String ?? ""
                    self.listDate.append(date1)
                    let date2 = value["date2"] as? String ?? ""
                    self.listDate.append(date2)
                    let date3 = value["date3"] as? String ?? ""
                    self.listDate.append(date3)
                    //print(self.listCinema)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            })
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "dateCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell") as! DateTableViewCell
        //cell.textLabel?.text = listDate[indexPath.row]
        cell.TestLabel.text = listDate[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
                case "showTime":
                    let movieDetailVC = segue.destination as! ShowTimeBookTicketViewController
                    if let indexPath = self.tableView.indexPathForSelectedRow {
                        movieDetailVC.passedDataIdMovie2 = passedDateIdMovie
                        movieDetailVC.passedDataCinema2 = passedDataCinema
                        movieDetailVC.passedDataDate = listDate[indexPath.row]
                    }
                default:
                    break
            }
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   

}
