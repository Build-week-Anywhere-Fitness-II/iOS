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
    
    var user : User?
    var image : UIImage?

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
        updateImage()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions
    @IBAction func AddPhotoButtonTapped(_ sender: Any) {
        
    }
    
    func updateImage() {
        userImage.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        userImage.addGestureRecognizer(tapGesture)
    }

    @objc func presentPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func SignUpButtonTapped(_ sender: Any) {
      guard
        let usernameText = usernameTextfield.text, !usernameText.isEmpty,
        let nameText = nameTexftfield.text, !nameText.isEmpty,
        let emailText = emailTextfield.text, !emailText.isEmpty,
        let passwordText = passwordTextfield.text, !passwordText.isEmpty else {
            return }
        guard let imageSelected = self.image, let imageData = imageSelected.jpegData(compressionQuality: 0.9) else {
            print("Image is nil")
            return
        }
        
        var isInstructor: Bool = false
             switch userTypeSegmentedController.selectedSegmentIndex {
             case 1:
                 isInstructor = true
             default:
                 isInstructor = false
             }
        
        Auth.auth().createUser(withEmail: emailText, password: passwordText) { (authDataResult, error) in
            if error == nil {
              Auth.auth().signIn(withEmail: emailText,
                                 password: passwordText)
            }
            
            if let authData = authDataResult {
                print(authData.user.email)
                var dict: [String: Any] = [
                    "uid": authData.user.uid,
                    "username": usernameText,
                    "name": nameText,
                    "email": authData.user.email,
                    "profileImageUrl": "",
                    "isInstructor": isInstructor
                    ]

                let storageRef = Storage.storage().reference(forURL: "gs://anywherefitness2-ea6b8.appspot.com")
                let storageProfileRef = storageRef.child("profile").child(authData.user.uid)

                let metadata = StorageMetadata()
                metadata.contentType = "image/json"

                storageProfileRef.putData(imageData, metadata: metadata, completion: { (_, error) in
                    if error != nil {
                        print(error?.localizedDescription)
                        return
                    }

                    storageProfileRef.downloadURL(completion: { (url, error) in
                        if let metaImageUrl = url?.absoluteString {
                            dict["profileImageUrl"] = metaImageUrl

                            Database.database().reference().child("users").child(authData.user.uid).updateChildValues(dict, withCompletionBlock: { (error, _) in
                                if error == nil {
                                    print("Done")
                                }
                            })
                        }
                    })
                })
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

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {

        print("Didfinish picking media")

        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            image = imageSelected
            userImage.image = imageSelected
        }

        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = imageOriginal
            userImage.image = imageOriginal
        }

        picker.dismiss(animated: true, completion: nil)
    }

}


