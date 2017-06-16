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
    var post = [String:AnyObject]()
    var listChair:String = ""
    var passedDataIdMovie3:String!
    var passedDataDate3:String!
    var passedDataCinema3:String!
    var passedDataTime:String!
    var soLuong:Int = 0
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
        if (passedDataDate3 != nil && passedDataIdMovie3 != nil && passedDataCinema3 != nil && passedDataTime != nil) {
            ref.child("Chair").child(passedDataIdMovie3).child(passedDataCinema3).child(passedDataDate3).child(passedDataTime).observeSingleEvent(of: .value, with: { (snapshot) in
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
                    
                    self.checkChair()
                }
            })
        
        }
        
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
                soLuong += 1
            }
            else {
                chair1.backgroundColor = UIColor.white
                soLuong -= 1
            }
            
            isCheck1 = !isCheck1
        }
        
        
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
                soLuong += 1
            }
            else {
                chair2.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheck2 = !isCheck2
        }
        
        
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
                soLuong += 1
            }
            else {
                chair3.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheck3 = !isCheck3
        }
        
        
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
                soLuong += 1
            }
            else {
                chair4.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheck4 = !isCheck4
        }
        
        
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
                soLuong += 1
            }
            else {
                chairB1.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckB1 = !isCheckB1
        }
        
        
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
                soLuong += 1
            }
            else {
                chairB2.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckB2 = !isCheckB2
        }
        
        
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
                soLuong += 1
            }
            else {
                chairB3.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckB3 = !isCheckB3
        }
        
        
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
                soLuong += 1
            }
            else {
                chairB4.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckB4 = !isCheckB4
        }
        
        
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
                soLuong += 1
            }
            else {
                chairC1.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckC1 = !isCheckC1
        }
        
        
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
                soLuong += 1
            }
            else {
                chairC2.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckC2 = !isCheckC2
        }
        
        
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
                soLuong += 1
            }
            else {
                chairC3.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckC3 = !isCheckC3
        }
        
        
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
                soLuong += 1
            }
            else {
                chairC4.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckC4 = !isCheckC4
        }
        
        
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
                soLuong += 1
            }
            else {
                chairD1.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckD1 = !isCheckD1
        }
        
        
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
                soLuong += 1
            }
            else {
                chairD2.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckD2 = !isCheckD2
        }
        
        
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
                soLuong += 1
            }
            else {
                chairD3.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckD3 = !isCheckD3
        }
        
        
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
                soLuong += 1
            }
            else {
                chairD4.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckD4 = !isCheckD4
        }
        
        
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
                soLuong += 1
            }
            else {
                chairE1.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckE1 = !isCheckE1
        }
        
        
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
                soLuong += 1
            }
            else {
                chairE2.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckE2 = !isCheckE2
        }
        
        
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
                soLuong += 1
            }
            else {
                chairE3.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckE3 = !isCheckE3
        }
        
        
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
                soLuong += 1
            }
            else {
                chairE4.backgroundColor = UIColor.white
                soLuong -= 1
            }
            isCheckE4 = !isCheckE4
        }
        
        
    }
    
    
    @IBAction func confirmBookButtonTapped(_ sender: Any) {
        if soLuong == 0 {
            let alert = UIAlertController(title: "Thông báo", message: "Bạn lòng chọn ghế trước!", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if !isCheck1 {
                post["a1"] = "t" as AnyObject
                listChair += "A1 "
            }
            if !isCheck2 {
                post["a2"] = "t" as AnyObject
                listChair += "A2 "
            }
            if !isCheck3 {
                post["a3"] = "t" as AnyObject
                listChair += "A3 "
            }
            if !isCheck4 {
                post["a4"] = "t" as AnyObject
                listChair += "A4 "
            }
            if !isCheckB1 {
                post["b1"] = "t" as AnyObject
                listChair += "B1 "
            }
            if !isCheckB2 {
                post["b2"] = "t" as AnyObject
                listChair += "B2 "
            }
            if !isCheckB3 {
                post["b3"] = "t" as AnyObject
                listChair += "B3 "
            }
            if !isCheckB4 {
                post["b4"] = "t" as AnyObject
                listChair += "B4 "
            }
            if !isCheckC1 {
                post["c1"] = "t" as AnyObject
                listChair += "C1 "
            }
            if !isCheckC2 {
                post["c2"] = "t" as AnyObject
                listChair += "C2 "
            }
            if !isCheckC3 {
                post["c3"] = "t" as AnyObject
                listChair += "C3 "
            }
            if !isCheckC4 {
                post["c4"] = "t" as AnyObject
                listChair += "C4 "
            }
            if !isCheckD1 {
                post["d1"] = "t" as AnyObject
                listChair += "D1 "
            }
            if !isCheckD2 {
                post["d2"] = "t" as AnyObject
                listChair += "D2 "
            }
            if !isCheckD3 {
                post["d3"] = "t" as AnyObject
                listChair += "D3 "
            }
            if !isCheckD4 {
                post["d4"] = "t" as AnyObject
                listChair += "D4 "
            }
            if !isCheckE1 {
                post["e1"] = "t" as AnyObject
                listChair += "E1 "
            }
            if !isCheckE2 {
                post["e2"] = "t" as AnyObject
                listChair += "E2 "
            }
            if !isCheckE3 {
                post["e3"] = "t" as AnyObject
                listChair += "E3 "
            }
            if !isCheckE4 {
                post["e4"] = "t" as AnyObject
                listChair += "E4 "
            }
            performSegue(withIdentifier: "finish", sender: self)
            post.removeAll()
            listChair = ""
        }
        /*let kq:String  = "t"
        let post : [String:AnyObject] = ["a1" : kq as AnyObject,
                                         "a2" : kq as AnyObject,
                                         "a3" : kq as AnyObject,
                                         "a4" : kq as AnyObject]
        ref.child("Chair").child(passedDataIdMovie3).child(passedDataCinema3).child(passedDataDate3).child(passedDataTime).updateChildValues(post)*/
    }
    
    func checkChair() {
        if cA1 == "t" {
            chair1.backgroundColor = UIColor.red
        }
        if cA2 == "t" {
            chair2.backgroundColor = UIColor.red
        }
        if cA3 == "t" {
            chair3.backgroundColor = UIColor.red
        }
        if cA4 == "t" {
            chair4.backgroundColor = UIColor.red
        }
        if cB1 == "t" {
            chairB1.backgroundColor = UIColor.red
        }
        if cB2 == "t" {
            chairB2.backgroundColor = UIColor.red
        }
        if cB3 == "t" {
            chairB3.backgroundColor = UIColor.red
        }
        if cB4 == "t" {
            chairB4.backgroundColor = UIColor.red
        }
        if cC1 == "t" {
            chairC1.backgroundColor = UIColor.red
        }
        if cC2 == "t" {
            chairC2.backgroundColor = UIColor.red
        }
        if cC3 == "t" {
            chairC3.backgroundColor = UIColor.red
        }
        if cC4 == "t" {
            chairC4.backgroundColor = UIColor.red
        }
        if cD1 == "t" {
            chairD1.backgroundColor = UIColor.red
        }
        if cD2 == "t" {
            chairD2.backgroundColor = UIColor.red
        }
        if cD3 == "t" {
            chairD3.backgroundColor = UIColor.red
        }
        if cD4 == "t" {
            chairD4.backgroundColor = UIColor.red
        }
        if cE1 == "t" {
            chairE1.backgroundColor = UIColor.red
        }
        if cE2 == "t" {
            chairE2.backgroundColor = UIColor.red
        }
        if cE3 == "t" {
            chairE3.backgroundColor = UIColor.red
        }
        if cE4 == "t" {
            chairE4.backgroundColor = UIColor.red
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finish" {
            if let destination = segue.destination as? BillViewController {
                destination.passedDataIdMovie4 = self.passedDataIdMovie3
                destination.passedDataCinema4 = self.passedDataCinema3
                destination.passedDataDate4 = self.passedDataDate3
                destination.passedDataTime4 = self.passedDataTime
                destination.soLuong4 = self.soLuong
                destination.post4 = self.post
                destination.listChair4 = self.listChair
            }
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
