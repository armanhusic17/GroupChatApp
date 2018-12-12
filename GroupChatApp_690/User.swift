//
//  User.swift
//  GroupChatApp_690
//
//  Created by Arman Husic on 12/5/18.
//  Copyright © 2018 Arman Husic. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase


struct User {
    let id = Auth.auth().currentUser?.email
    let username: String
}


extension User {
    
    static let ref = Database.database().reference()
    
    static func createUser(
        username: String,
        completion: @escaping (Error?, User?) -> Void) {
        
        let refUsers = ref.child("users")
        let refUser = refUsers.childByAutoId()
        
        var data = [String: Any]()
        data["username"] = username
        data["id"] = refUser.key
        
        refUser.setValue(data) { (error, ref) in
            if error != nil {
                completion(error, nil)
            } else {
                let user = User(username: username)
                completion(nil, user)
            }
        }
    }
}
