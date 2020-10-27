//
//  FirebaseController.swift
//  AnywhereFitness2
//
//  Created by John McCants on 10/21/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum NetworkError: Error {
    case noData
    case failedSignUp
    case failedSignIn
    case noToken
    case tryAgain
    case failedDecoding
    case failedEncoding
    case failedResponse
    case noIdentifier
    case noRep
    case otherError
}


class FirebaseController {
    
    private let firebaseURL = "https://anywherefitness2-ea6b8.firebaseio.com/users"
    let ref = Database.database().reference()
    var currentUser: User?
    
    static let shared = FirebaseController()
    private init() { }
    
    func setUser(completion: @escaping (User) -> Void) {
        if let identifier = Auth.auth().currentUser?.uid {
            ref.child("users").child(identifier).observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                if let username = value?["username"] as? String,
                let name = value?["name"] as? String,
                let imageString = value?["profileImageUrl"] as? String,
                let imageURL = URL(string: imageString),
                let isInstructor = value?["isInstructor"] as? Bool,
                let uidString = value?["uid"] as? String,
                let emailString = value?["email"] as? String {
                let user = User(uid: uidString, isInstructor: isInstructor, name: name, username: username, image: imageURL, email: emailString)
                print(user)
                completion(user)
                }
            })
        }
    }
    
    func getUser(completion: @escaping (User) -> Void) {
        if let identifier = Auth.auth().currentUser?.uid {
            ref.child("users").child(identifier).observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                if let username = value?["username"] as? String,
                    let name = value?["name"] as? String,
                    let imageString = value?["profileImageUrl"] as? String,
                    let imageURL = URL(string: imageString),
                    let isInstructor = value?["isInstructor"] as? Bool,
                    let uidString = value?["uid"] as? String,
                    let emailString = value?["email"] as? String {
                    let user = User(uid: uidString, isInstructor: isInstructor, name: name, username: username, image: imageURL, email: emailString)
                    print(user)
                    completion(user)
                }
            })
        }
    }
    
    func updateUser(key: String, value: String) {
        if let userID = Auth.auth().currentUser?.uid {
              ref.child("users").child(userID).updateChildValues(["\(key)": value])
          }
    }
    
    func getImage(imageUrl: URL, completion: @escaping (UIImage?) -> Void) {
        let request = URLRequest(url: imageUrl)

        if let urlResponse = URLCache.shared.cachedResponse(for: request) {
            let profileImage = UIImage(data: urlResponse.data)
            completion(profileImage)
            return
        }

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error retrieving profile image: \(error)")
                completion(nil)
                return
            }

            if let data = data, let response = response {
                let cachedResponse = CachedURLResponse(response: response, data: data)
                URLCache.shared.storeCachedResponse(cachedResponse, for: request)
                let profileImage = UIImage(data: data)
                print("successfully got image data")
                completion(profileImage)
                return
            }
        }.resume()
    }
    
    func updateProfile(image: UIImage?, username: String, name: String) {
        guard let image = image else {return}
        
        if let currentUser1 = Auth.auth().currentUser, let currentUser2 = currentUser {
        let userID = currentUser1.uid
        guard let imageData = image.jpegData(compressionQuality: 0.9) else {
                    print("Image is nil")
                    return
                }
        var dict: [String: Any] = [
        "uid": userID,
        "username": username,
        "name": name,
        "email": currentUser2.email,
        "profileImageUrl": "",
        "isInstructor": currentUser2.isInstructor
        ]
        let storageRef = Storage.storage().reference(forURL: "gs://anywherefitness2-ea6b8.appspot.com")
            let storageProfileRef = storageRef.child("profile").child(userID)

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
                                   Database.database().reference().child("users").child(userID).updateChildValues(dict, withCompletionBlock: { (error, _) in
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
