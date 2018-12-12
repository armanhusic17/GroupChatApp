//
//  roomsViewController.swift
//  GroupChatApp_690
//
//  Created by Arman Husic on 12/5/18.
//  Copyright © 2018 Arman Husic. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

class roomsViewController: UITableViewController {
    var currentUser: User?
    var rooms = [Room]()
    let cellRoomId = "RoomId"
    
    @IBOutlet weak var logOutButton: UIBarButtonItem!
    
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        performSegue(withIdentifier: "logOutSegue", sender: nil)
        
        
    }
    
    
    
    @IBAction func newRoomTouched(_ sender: Any) {
        performSegue(withIdentifier: "ShowCreateRoom", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Room.getAllRooms { [weak self] (roomsFound) in
            self?.rooms = roomsFound
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChatView" {
            let destination = segue.destination as? ChatViewController
            destination?.roomSelected = sender as? Room
            destination?.currentUser = currentUser?.username
        }
    }
}

extension roomsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let room = rooms[indexPath.row]
        
        performSegue(withIdentifier: "ShowChatView", sender: room)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellRoomId)!
        
        let room = rooms[indexPath.row]
        cell.textLabel?.text = room.name
        
        return cell
    }
}



