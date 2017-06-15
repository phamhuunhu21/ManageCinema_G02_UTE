//
//  ChooseChairViewController.swift
//  MovieG02
//
//  Created by Pham Huu Nhu on 6/15/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import Firebase

class ChooseChairViewController: UIViewController {

    var ref: DatabaseReference!
    
    @IBOutlet weak var chair1: UIButton!
    @IBOutlet weak var chair2: UIButton!
    @IBOutlet weak var chair3: UIButton!
    @IBOutlet weak var chair4: UIButton!
    @IBOutlet weak var chairB1: UIButton!
    @IBOutlet weak var chairB2: UIButton!
    @IBOutlet weak var chairB3: UIButton!
    @IBOutlet weak var chairB4: UIButton!
    @IBOutlet weak var chairC1: UIButton!
    @IBOutlet weak var chairC2: UIButton!
    @IBOutlet weak var chairC3: UIButton!
    @IBOutlet weak var chairC4: UIButton!
    @IBOutlet weak var chairD1: UIButton!
    @IBOutlet weak var chairD2: UIButton!
    @IBOutlet weak var chairD3: UIButton!
    @IBOutlet weak var chairD4: UIButton!
    @IBOutlet weak var chairE1: UIButton!
    @IBOutlet weak var chairE2: UIButton!
    @IBOutlet weak var chairE3: UIButton!
    @IBOutlet weak var chairE4: UIButton!
    
    var cA1, cA2, cA3, cA4, cB1, cB2, cB3, cB4, cC1, cC2, cC3, cC4, cD1, cD2, cD3, cD4, cE1, cE2, cE3, cE4 : String!
    var isCheck1:Bool = true
    var isCheck2:Bool = true
    var isCheck3:Bool = true
    var isCheck4:Bool = true
    var isCheckB1:Bool = true
    var isCheckB2:Bool = true
    var isCheckB3:Bool = true
    var isCheckB4:Bool = true
    var isCheckC1:Bool = true
    var isCheckC2:Bool = true
    var isCheckC3:Bool = true
    var isCheckC4:Bool = true
    var isCheckD1:Bool = true
    var isCheckD2:Bool = true
    var isCheckD3:Bool = true
    var isCheckD4:Bool = true
    var isCheckE1:Bool = true
    var isCheckE2:Bool = true
    var isCheckE3:Bool = true
    var isCheckE4:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        
        ref.child("Chair").child("1").child("Galaxy An Dương Vương").child("15-06-2017").child("09h30").observeSingleEvent(of: .value, with: { (snapshot) in
            if let value = snapshot.value as? [String: AnyObject] {
                let a1 = value["a1"] as? String ?? ""
                let a2 = value["a2"] as? String ?? ""
                let a3 = value["a3"] as? String ?? ""
                let a4 = value["a4"] as? String ?? ""
                let b1 = value["b1"] as? String ?? ""
                let b2 = value["b2"] as? String ?? ""
                let b3 = value["b3"] as? String ?? ""
                let b4 = value["b4"] as? String ?? ""
                let c1 = value["c1"] as? String ?? ""
                let c2 = value["c2"] as? String ?? ""
                let c3 = value["c3"] as? String ?? ""
                let c4 = value["c4"] as? String ?? ""
                let d1 = value["d1"] as? String ?? ""
                let d2 = value["d2"] as? String ?? ""
                let d3 = value["d3"] as? String ?? ""
                let d4 = value["d4"] as? String ?? ""
                let e1 = value["e1"] as? String ?? ""
                let e2 = value["e2"] as? String ?? ""
                let e3 = value["e3"] as? String ?? ""
                let e4 = value["e4"] as? String ?? ""
                self.cA1 = a1
                self.cA2 = a2
                self.cA3 = a3
                self.cA4 = a4
                self.cB1 = b1
                self.cB2 = b2
                self.cB3 = b3
                self.cB4 = b4
                self.cC1 = c1
                self.cC2 = c2
                self.cC3 = c3
                self.cC4 = c4
                self.cD1 = d1
                self.cD2 = d2
                self.cD3 = d3
                self.cD4 = d4
                self.cE1 = e1
                self.cE2 = e2
                self.cE3 = e3
                self.cE4 = e4
            }
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chair1ButtonTapped(_ sender: Any) {
        if cA1 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheck1 {
                chair1.backgroundColor = UIColor.green
            }
            else {
                chair1.backgroundColor = UIColor.white
            }
        }
        
        isCheck1 = !isCheck1
    }
    
    @IBAction func chair2ButtonTapped(_ sender: Any) {
        if cA2 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheck2 {
                chair2.backgroundColor = UIColor.green
            }
            else {
                chair2.backgroundColor = UIColor.white
            }
        }
        
        isCheck2 = !isCheck2
    }
    @IBAction func chair3ButtonTapped(_ sender: Any) {
        if cA3 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheck3 {
                chair3.backgroundColor = UIColor.green
            }
            else {
                chair3.backgroundColor = UIColor.white
            }
        }
        
        isCheck3 = !isCheck3
    }
    @IBAction func chair4ButtonTapped(_ sender: Any) {
        if cA4 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheck4 {
                chair4.backgroundColor = UIColor.green
            }
            else {
                chair4.backgroundColor = UIColor.white
            }
        }
        
        isCheck4 = !isCheck4
    }
    
    @IBAction func chairB1ButtonTapped(_ sender: Any) {
        if cB1 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckB1 {
                chairB1.backgroundColor = UIColor.green
            }
            else {
                chairB1.backgroundColor = UIColor.white
            }
        }
        
        isCheckB1 = !isCheckB1
    }
    
    @IBAction func chairB2ButtonTapped(_ sender: Any) {
        if cB2 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckB2 {
                chairB2.backgroundColor = UIColor.green
            }
            else {
                chairB2.backgroundColor = UIColor.white
            }
        }
        
        isCheckB2 = !isCheckB2
    }
    
    @IBAction func chairB3ButtonTapped(_ sender: Any) {
        if cB3 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckB3 {
                chairB3.backgroundColor = UIColor.green
            }
            else {
                chairB3.backgroundColor = UIColor.white
            }
        }
        
        isCheckB3 = !isCheckB3
    }
    
    @IBAction func chairB4ButtonTapped(_ sender: Any) {
        if cB4 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckB4 {
                chairB4.backgroundColor = UIColor.green
            }
            else {
                chairB4.backgroundColor = UIColor.white
            }
        }
        
        isCheckB4 = !isCheckB4
    }
    
    @IBAction func chairC1ButtonTapped(_ sender: Any) {
        if cC1 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckC1 {
                chairC1.backgroundColor = UIColor.green
            }
            else {
                chairC1.backgroundColor = UIColor.white
            }
        }
        
        isCheckC1 = !isCheckC1
    }
    
    @IBAction func chairC2ButtonTapped(_ sender: Any) {
        if cC2 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckC2 {
                chairC2.backgroundColor = UIColor.green
            }
            else {
                chairC2.backgroundColor = UIColor.white
            }
        }
        
        isCheckC2 = !isCheckC2
    }
    
    @IBAction func chairC3ButtonTapped(_ sender: Any) {
        if cC3 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckC3 {
                chairC3.backgroundColor = UIColor.green
            }
            else {
                chairC3.backgroundColor = UIColor.white
            }
        }
        
        isCheckC3 = !isCheckC3
    }
    
    @IBAction func chairC4ButtonTapped(_ sender: Any) {
        if cC4 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckC4 {
                chairC4.backgroundColor = UIColor.green
            }
            else {
                chairC4.backgroundColor = UIColor.white
            }
        }
        
        isCheckC4 = !isCheckC4
    }
    
    @IBAction func chairD1ButtonTapped(_ sender: Any) {
        if cD1 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckD1 {
                chairD1.backgroundColor = UIColor.green
            }
            else {
                chairD1.backgroundColor = UIColor.white
            }
        }
        
        isCheckD1 = !isCheckD1
    }
    
    @IBAction func chairD2ButtonTapped(_ sender: Any) {
        if cD2 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckD2 {
                chairD2.backgroundColor = UIColor.green
            }
            else {
                chairD2.backgroundColor = UIColor.white
            }
        }
        
        isCheckD2 = !isCheckD2
    }
    
    @IBAction func chairD3ButtonTapped(_ sender: Any) {
        if cD3 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckD3 {
                chairD3.backgroundColor = UIColor.green
            }
            else {
                chairD3.backgroundColor = UIColor.white
            }
        }
        
        isCheckD3 = !isCheckD3
    }
    
    @IBAction func chairD4ButtonTapped(_ sender: Any) {
        if cD4 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckD4 {
                chairD4.backgroundColor = UIColor.green
            }
            else {
                chairD4.backgroundColor = UIColor.white
            }
        }
        
        isCheckD4 = !isCheckD4
    }
    
    @IBAction func chairE1ButtonTapped(_ sender: Any) {
        if cE1 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckE1 {
                chairE1.backgroundColor = UIColor.green
            }
            else {
                chairE1.backgroundColor = UIColor.white
            }
        }
        
        isCheckE1 = !isCheckE1
    }
    
    @IBAction func chairE2ButtonTapped(_ sender: Any) {
        if cE2 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckE2 {
                chairE2.backgroundColor = UIColor.green
            }
            else {
                chairE2.backgroundColor = UIColor.white
            }
        }
        
        isCheckE2 = !isCheckE2
    }
    
    @IBAction func chairE3ButtonTapped(_ sender: Any) {
        if cE3 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckE3 {
                chairE3.backgroundColor = UIColor.green
            }
            else {
                chairE3.backgroundColor = UIColor.white
            }
        }
        
        isCheckE3 = !isCheckE3
    }
    
    @IBAction func chairE4ButtonTapped(_ sender: Any) {
        if cE4 == "t" {
            let alert = UIAlertController(title: "Error", message: "Ghế này đã có người đặt, vui lòng chọn ghế khác", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if isCheckE4 {
                chairE4.backgroundColor = UIColor.green
            }
            else {
                chairE4.backgroundColor = UIColor.white
            }
        }
        
        isCheckE4 = !isCheckE4
    }
    
    
    @IBAction func confirmBookButtonTapped(_ sender: Any) {
        let z:String  = "aaa"
        let post : [String:AnyObject] = ["a1" : z as AnyObject,
                                         "a2" : z as AnyObject,
                                         "a3" : z as AnyObject,
                                         "a4" : z as AnyObject]
        ref.child("Chair").child("1").child("Galaxy An Dương Vương").child("15-06-2017").child("09h30").updateChildValues(post)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
    }

}
