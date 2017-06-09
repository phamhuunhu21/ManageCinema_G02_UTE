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

class ShowTimeBookViewController: UIViewController {

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    var passedData: String!
    var ref: DatabaseReference!
    var refHandler: UInt!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        //idMovieButton.setTitle(passedData, for: .normal)
        if (passedData != nil) {
            ref.child("Cinema").child(passedData).observeSingleEvent(of: .value, with: { (snapshot) in
                if let value = snapshot.value as? [String: AnyObject] {
                    let cinema1 = value["cinema1"] as? String ?? ""
                    let cinema2 = value["cinema2"] as? String ?? ""
                    
                    self.firstButton.setTitle(cinema1, for: .normal)
                    self.secondButton.setTitle(cinema2, for: .normal)
                }
            })
        }
        /*refHandler = ref.child("Cinema").child("1").observe(.childAdded, with: { (snapshot) in
            if let value = snapshot.value as? [String: AnyObject] {
                let cinema1 = value["cinema1"] as? String ?? ""
                let cinema2 = value["cinema2"] as? String ?? ""
                
                self.firstButton.setTitle(cinema1, for: .normal)
                self.secondButton.setTitle(cinema2, for: .normal)
            }
        })*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
