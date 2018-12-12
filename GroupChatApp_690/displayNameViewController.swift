//
//  displayNameViewController.swift
//  GroupChatApp_690
//
//  Created by Arman Husic on 12/5/18.
//  Copyright © 2018 Arman Husic. All rights reserved.
//

import UIKit

class displayNameViewController: UIViewController {
    //@IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowRooms" {
            let navigationController = segue.destination as? UINavigationController
            let roomsViewController = navigationController?.viewControllers.first as? roomsViewController
            roomsViewController?.currentUser = sender as? User
        }
    }
    
//    @IBAction func enterTouched() {
//    }
    
    
    @IBAction func enterButtonPressed(_ sender: Any) {
            if let username = usernameTextField.text {
                User.createUser(username: username) { [weak self] (error, user) in
                        if error == nil {
                            self?.performSegue(withIdentifier: "ShowRooms", sender: user)
                        }
                    }
                }
    }
    
}
