//
//  newRoomViewController.swift
//  GroupChatApp_690
//
//  Created by Arman Husic on 12/5/18.
//  Copyright © 2018 Arman Husic. All rights reserved.
//

import UIKit

class newRoomViewController: UIViewController {
    
    @IBOutlet weak var roomNameTextField: UITextField!
    
    @IBAction func createTouched(_ sender: Any) {
        let roomName = roomNameTextField.text
        
        if let roomName = roomName {
            Room.createRoom(name: roomName) { [weak self] (error) in
                if error == nil {
                    self?.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
}
