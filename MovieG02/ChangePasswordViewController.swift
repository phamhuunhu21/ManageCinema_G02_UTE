//
//  ChangePasswordViewController.swift
//  MovieG02
//
//  Created by Pham Huu Nhu on 6/13/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import Firebase

class ChangePasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var oldPassTextField: UITextField!
    @IBOutlet weak var newPassTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    var ref: DatabaseReference!
    var pass:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        self.oldPassTextField.delegate = self
        self.newPassTextField.delegate = self
        self.confirmTextField.delegate = self
        getPassword()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let oldPass:String = oldPassTextField.text!
        let newPass:String = newPassTextField.text!
        let confirmPass:String = confirmTextField.text!
        if (oldPassTextField.text?.isEmpty)! || (newPassTextField.text?.isEmpty)! || (confirmTextField.text?.isEmpty)! {
            let alert = UIAlertController(title: "Error", message: "Vui lòng nhập đầy đủ thông tin", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if newPass != confirmPass {
                let alert = UIAlertController(title: "Error", message: "Mật khẩu không trùng khớp", preferredStyle: UIAlertControllerStyle.alert);
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
                self.present(alert, animated: true, completion: nil)
            }
            else if newPass.characters.count < 6 || oldPass.characters.count < 6 || confirmPass.characters.count < 6 {
                let alert = UIAlertController(title: "Error", message: "Mật khẩu có độ dài từ 6 ký tự trở lên", preferredStyle: UIAlertControllerStyle.alert);
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
                self.present(alert, animated: true, completion: nil)
            }
            else if oldPass != pass{
                let alert = UIAlertController(title: "Error", message: "Sai mật khẩu hiện tại", preferredStyle: UIAlertControllerStyle.alert);
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
                self.present(alert, animated: true, completion: nil)
            }
            else {
                Auth.auth().currentUser?.updatePassword(to: newPass, completion: { (error) in
                    if error == nil {
                        let update = ["password" : newPass]
                        let idUser = Auth.auth().currentUser?.uid
                        self.ref.child("Users").child(idUser!).updateChildValues(update)
                        let alert = UIAlertController(title: "Thông báo", message: "Đổi mật khẩu thành công!", preferredStyle: UIAlertControllerStyle.alert);
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
                        self.present(alert, animated: true, completion: nil)
                    }
                    else {
                        let alert = UIAlertController(title: "Error", message: "Có lỗi trong quá trình", preferredStyle: UIAlertControllerStyle.alert);
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
                        self.present(alert, animated: true, completion: nil)
                    }
                })
            }
        }
        
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        newPassTextField.resignFirstResponder()
        oldPassTextField.resignFirstResponder()
        confirmTextField.resignFirstResponder()
        return true
    }
    
    func getPassword() {
        if let uid = Auth.auth().currentUser?.uid{
            ref.child("Users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                if let value = snapshot.value as? [String: AnyObject] {
                    let password = value["password"] as? String ?? ""
                    self.pass = password
                }
            })
        }
    }
}
