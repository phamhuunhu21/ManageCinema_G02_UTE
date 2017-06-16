//
//  HistoryViewController.swift
//  MovieG02
//
//  Created by Pham Huu Nhu on 6/16/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import Firebase

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ref: DatabaseReference!
    var history = [History]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getDataHistory()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }

    func getDataHistory() {
        self.history = [History]()
        if let uid = Auth.auth().currentUser?.uid {
            ref.child("History").child(uid).observe(.childAdded, with: { (snapshot) in
                 if let dictionary = snapshot.value as? [String: AnyObject] {
                    let his_title = dictionary["title"] as? String
                    let his_cinema = dictionary["cinema"] as? String
                    let his_date = dictionary["date"] as? String
                    let his_time = dictionary["time"] as? String
                    let his_chair = dictionary["chair"] as? String
                    self.history.append(History(title: his_title!, cinema: his_cinema!, date: his_date!, time: his_time!, chair: his_chair!))
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            })
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell") as! HistoryTableViewCell
        var hs: History
        hs = history[indexPath.row]
        cell.titleLabel.text = "Phim: " + hs.getTitle()
        cell.cinemaLabel.text = "Rạp: " + hs.getCinema()
        cell.dateLabel.text = "Ngày: " + hs.getDate()
        cell.timeLabel.text = "Vào lúc: " + hs.getTime()
        cell.chairLabel.text = "Số ghế: " + hs.getChair()
        return cell
    }


    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
