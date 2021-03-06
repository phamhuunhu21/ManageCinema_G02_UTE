//
//  BillViewController.swift
//  MovieG02
//
//  Created by Pham Huu Nhu on 6/16/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import Firebase

class BillViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cinemaLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var chairLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var ref: DatabaseReference!
    var passedDataIdMovie4:String!
    var passedDataDate4:String!
    var passedDataCinema4:String!
    var passedDataTime4:String!
    var soLuong4:Int!
    var post4 = [String:AnyObject]()
    var listChair4:String!
    var titleCinema:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ref.child("Movie").child(passedDataIdMovie4).observeSingleEvent(of: .value, with: { (snapshot) in
            if let value = snapshot.value as? [String: AnyObject] {
                let title = value["title"] as? String ?? ""
                self.titleLabel.text = "Phim: " + title
                self.titleCinema = title
            }
        })
        
        let price:String = String(soLuong4*75000)
        cinemaLabel.text = "Rạp: " + passedDataCinema4
        dateLabel.text = "Ngày: " + passedDataDate4
        timeLabel.text = "Vào lúc: " + passedDataTime4
        priceLabel.text = "Tổng tiền: " + price
        chairLabel.text = "Ghế: " + listChair4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func finishButtonTapped(_ sender: Any) {
        ref.child("Chair").child(passedDataIdMovie4).child(passedDataCinema4).child(passedDataDate4).child(passedDataTime4).updateChildValues(post4)
        
        getHistory()
        
        
    }
    
    func getHistory() {
        let history : [String:AnyObject] = ["title" : titleCinema as AnyObject,
                                            "cinema" : passedDataCinema4 as AnyObject,
                                            "date" : passedDataDate4 as AnyObject,
                                            "time" : passedDataTime4 as AnyObject,
                                            "chair" : listChair4 as AnyObject]
        if let uid = Auth.auth().currentUser?.uid {
            ref.child("History").child(uid).childByAutoId().setValue(history)
        }
        
        /*let alert = UIAlertController(title: "Thông báo", message: "Đặt phim thành công", preferredStyle: UIAlertControllerStyle.alert);
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
         self.present(alert, animated: true, completion: nil)*/
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loggedInVC:HomeViewController = storyboard.instantiateViewController(withIdentifier: "LoggedInHomeVC") as! HomeViewController
        self.present(loggedInVC, animated: true, completion: nil)
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
