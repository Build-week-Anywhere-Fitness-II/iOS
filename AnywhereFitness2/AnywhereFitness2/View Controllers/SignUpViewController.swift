//
//  SignUpViewController.swift
//  AnywhereFitness2
//
//  Created by Zachary Thacker on 10/15/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit

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
    @IBOutlet weak var aboutMeTextview: UITextView!
    @IBOutlet weak var signInButton: UIButton!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions
    
    @IBAction func SignInButtonTapped(_ sender: Any) {
        
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
