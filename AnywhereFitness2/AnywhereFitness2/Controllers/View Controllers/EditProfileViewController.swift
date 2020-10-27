//
//  EditProfileViewController.swift
//  AnywhereFitness2
//
//  Created by Zachary Thacker on 10/20/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, UINavigationControllerDelegate {

    //MARK: - IBOutlets
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var segmentedController: UISegmentedControl!
    var photoSelected: Bool = false
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var profileUpdateQueue = OperationQueue()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        currentUser()
        updateImage()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    @IBAction func changePhotoButtonTapped(_ sender: Any) {
    }
    
    @IBAction func saveChangesButtonTapped(_ sender: Any) {
        guard let nameText = nameTextField.text, nameText != "", let usernameText = usernameTextField.text, usernameText != "" else {
            return
        }
        

        let firebaseOp = BlockOperation {
            FirebaseController.shared.updateProfile(image: self.userImage.image, username: usernameText, name: nameText)
            print("Successfully Completed 1")
            self.activityIndicator.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
                self.activityIndicator.isHidden = true
                let alert = UIAlertController(title: "Success", message: "Updated Profile", preferredStyle: .alert)
                            let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                                 self.dismiss(animated: true) {
                                 print("Successfully Completed 3")
                            }
                
            }
            alert.addAction(action)
            self.present(alert, animated: true)
            
        }
        }

        let completeOp = BlockOperation {
            print("Successfully Completed 2")
        }
        

            OperationQueue.main.addOperations([firebaseOp, completeOp], waitUntilFinished: false)

        
        print("successfully saved changes")
    }
    
    private func currentUser() {
        if let imageURL = FirebaseController.shared.currentUser?.image {
            FirebaseController.shared.getImage(imageUrl: imageURL, completion: { image in
                DispatchQueue.main.async {
                    self.userImage.image = image
                }
            })
        }
        usernameTextField.text = FirebaseController.shared.currentUser?.username
        nameTextField.text = FirebaseController.shared.currentUser?.name
        
       
    }
    
    func updateImage() {
        userImage.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        userImage.addGestureRecognizer(tapGesture)
        userImage.setRounded()
    }

    @objc func presentPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    func updateViews() {
        emailTextField.isUserInteractionEnabled = false
        passwordTextField.isUserInteractionEnabled = false
        activityIndicator.isHidden = true
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

extension EditProfileViewController: UITextFieldDelegate {
    
}

extension EditProfileViewController: UIImagePickerControllerDelegate {
// MARK: - UIImagePickerControllerDelegate Methods
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        userImage.contentMode = .scaleAspectFit
        userImage.image = pickedImage
        photoSelected = true
    }

    dismiss(animated: true, completion: nil)
}

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
extension UIImageView {

    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
