//
//  SignInAndSignUpViewController.swift
//  MovieG02
//
//  Created by Pham Huu Nhu on 6/8/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase

class SignInAndSignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var signInSelector: UISegmentedControl!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    var isSignIn:Bool = true
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.fullnameTextField.delegate = self
        self.addressTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.phoneTextField.delegate = self
        Hidden()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        isSignIn = !isSignIn
        if isSignIn {
            Hidden()
        }
        else {
            UnHidden()
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        ref = Database.database().reference()
        
        let email = emailTextField.text
        let password = passwordTextField.text
        let fullname = fullnameTextField.text
        let address = addressTextField.text
        let phone = phoneTextField.text
        
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty
            || fullnameTextField.text!.isEmpty || addressTextField.text!.isEmpty || phoneTextField.text!.isEmpty{
            let alert = UIAlertController(title: "Error", message: "Vui lòng nhập đầy đủ thông tin", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if !(Validate.isValidEmail(testStr: email!)) {
                let alert = UIAlertController(title: "Error", message: "Sai định dạng email", preferredStyle: UIAlertControllerStyle.alert);
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
                self.present(alert, animated: true, completion: nil)
            }
            else if ((password?.characters.count)! < 6) {
                let alert = UIAlertController(title: "Error", message: "Mật khẩu phải từ 6 ký tự trở lên!", preferredStyle: UIAlertControllerStyle.alert);
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
                self.present(alert, animated: true, completion: nil)
            }
            else{
                Auth.auth().createUser(withEmail: email!, password: password!, completion: { (user, error) in
                    if error == nil{
                        let post : [String:AnyObject] = ["uid" : user?.uid as AnyObject,
                                                         "email" : email as AnyObject,
                                                         "password" : password as AnyObject,
                                                         "fullname" : fullname as AnyObject,
                                                         "address" : address as AnyObject,
                                                         "phone" : phone as AnyObject]
                        self.ref?.child("Users").child((user?.uid)!).setValue(post)
                        
                        let alert = UIAlertController(title: "Thông báo", message: "Tạo tài khoản thành công", preferredStyle: UIAlertControllerStyle.alert);
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
                        self.present(alert, animated: true, completion: nil)
                        
                        self.emailTextField.text = ""
                        self.passwordTextField.text = ""
                        self.fullnameTextField.text = ""
                        self.addressTextField.text = ""
                        self.phoneTextField.text = ""
                    }
                    else {
                        if let err = AuthErrorCode(rawValue: error!._code) {
                            switch err {
                            case .emailAlreadyInUse:
                                let alert = UIAlertController(title: "Error", message: "Email đã tồn tại, vui lòng thử lại", preferredStyle: UIAlertControllerStyle.alert);
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
                                self.present(alert, animated: true, completion: nil)
                            default:
                                let alert = UIAlertController(title: "Error", message: "Có lỗi trong quá trình, vui lòng thử lại", preferredStyle: UIAlertControllerStyle.alert);
                                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
                                self.present(alert, animated: true, completion: nil)
                            }
                        }
                    }
                })
            }
        }
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty{
            let alert = UIAlertController(title: "Error", message: "Vui lòng nhập đầy đủ thông tin", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil)
        }
        else {
            Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
                if error == nil {
                    self.presentLoggedInScreen()
                }
                else {
                    let alert = UIAlertController(title: "Error", message: "Đăng nhập thất bại", preferredStyle: UIAlertControllerStyle.alert);
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    func presentLoggedInScreen(){
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //let loggedInVC:UserViewController = storyboard.instantiateViewController(withIdentifier: "LoggedInVC") as! UserViewController
        let loggedInVC:HomeViewController = storyboard.instantiateViewController(withIdentifier: "LoggedInHomeVC") as! HomeViewController
        self.present(loggedInVC, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fullnameTextField.resignFirstResponder()
        addressTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
        return true
    }
    
    func Hidden() {
        signInLabel.text = "Sign In"
        fullnameLabel.isHidden = true
        fullnameTextField.isHidden = true
        addressLabel.isHidden = true
        addressTextField.isHidden = true
        phoneLabel.isHidden = true
        phoneTextField.isHidden = true
        signUpButton.isHidden = true
        signInButton.isHidden = false
    }
    
    func UnHidden() {
        signInLabel.text = "Sign Up"
        fullnameLabel.isHidden = false
        fullnameTextField.isHidden = false
        addressLabel.isHidden = false
        addressTextField.isHidden = false
        phoneLabel.isHidden = false
        phoneTextField.isHidden = false
        signInButton.isHidden = true
        signUpButton.isHidden = false
    }
    

}
