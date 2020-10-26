//
//  LoginViewController.swift
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

class LoginViewController: UIViewController {
    
    var currentUser : User?
    
    //MARK: - IBOutlets
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let emailText = usernameTextfield.text, let passwordText = passwordTextfield.text else {
            return }
        Auth.auth().signIn(withEmail: emailText, password: passwordText) { (result, error) in
                
            if error == nil {
                FirebaseController.shared.setUser { (user) in
                    DispatchQueue.main.async {
                        FirebaseController.shared.currentUser = user
                        self.currentUser = user
                        print(user)
                        DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "login", sender: sender)
                        print("Success")
                        }
                    }
                }
                
            } else {
                print(error)
                print("Unable to login")
                let alert = UIAlertController()
                let action = UIAlertAction(title: "Unable to sign in", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        
        }
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "login" {
//            guard let destinationVC = segue.destination as? HomeViewController , let currentUser = self.currentUser else {
//                print("no current user")
//                return}
//            let _ = destinationVC.view
//            destinationVC.usernameLabel.text = currentUser.username
//            destinationVC.currentUser? = currentUser
//            destinationVC.userImageLoad(currentUser: currentUser)
//            
//            print(currentUser.name)
//        }
    }
    

}
