//
//  UserInfoViewController.swift
//  MovieG02
//
//  Created by Pham Huu Nhu on 6/13/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import Firebase

class UserInfoViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        if let uid = Auth.auth().currentUser?.uid{
            ref.child("Users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                if let value = snapshot.value as? [String: AnyObject] {
                    let name = value["fullname"] as? String ?? ""
                    let email = value["email"] as? String ?? ""
                    let address = value["address"] as? String ?? ""
                    let phone = value["phone"] as? String ?? ""
                    
                    self.nameLabel.text = name
                    self.emailLabel.text = email
                    self.addressLabel.text = address
                    self.phoneLabel.text = phone
                    
                }
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
