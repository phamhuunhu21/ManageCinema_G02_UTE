//
//  ShowTimeBookViewController.swift
//  MovieG02
//
//  Created by Pham Huu Nhu on 6/9/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ShowTimeBookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
   
    
    var passedData: String!
    var ref: DatabaseReference!
    var listCinema = [String]()
    var list = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        getDataCinema()
        //getDataCinema()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func getDataCinema() {
        self.listCinema = [String]()
        if (passedData != nil) {
            ref.child("Cinema").child(passedData).observeSingleEvent(of: .value, with: { (snapshot) in
                if let value = snapshot.value as? [String: AnyObject] {
                    let cinema1 = value["cinema1"] as? String ?? ""
                    self.listCinema.append(cinema1)
                    let cinema2 = value["cinema2"] as? String ?? ""
                    self.listCinema.append(cinema2)
                    let cinema3 = value["cinema3"] as? String ?? ""
                    self.listCinema.append(cinema3)
                    let cinema4 = value["cinema4"] as? String ?? ""
                    self.listCinema.append(cinema4)
                    let cinema5 = value["cinema5"] as? String ?? ""
                    self.listCinema.append(cinema5)
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
        return listCinema.count
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cinemaCell")
        cell.textLabel?.text = listCinema[indexPath.row]
        
        return cell
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
