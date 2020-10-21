//
//  SignUpViewController.swift
//  AnywhereFitness2
//
//  Created by Zachary Thacker on 10/15/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class SignUpViewController: UIViewController {

    //MARK: - Enums
    
    enum LoginType {
        case signUp
        case SignIn
    }
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var userTypeSegmentedController: UISegmentedControl!
    @IBOutlet weak var nameTexftfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions
    @IBAction func AddPhotoButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func SignUpButtonTapped(_ sender: Any) {
      guard
            let emailText = emailTextfield.text,
            let passwordText = passwordTextfield.text else {
            return }
        
        Auth.auth().createUser(withEmail: emailText, password: passwordText) { (result, error) in
            if error == nil {
              // 3
              Auth.auth().signIn(withEmail: emailText,
                                 password: passwordText)
            }

            
        }
        
    
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
