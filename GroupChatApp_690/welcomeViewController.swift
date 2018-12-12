//
//  ViewController.swift
//  GroupChatApp_690
//
//  Created by Arman Husic on 12/5/18.
//  Copyright © 2018 Arman Husic. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class welcomeViewController: UIViewController, GIDSignInUIDelegate {
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()



        GIDSignIn.sharedInstance()?.uiDelegate = self



        // Do any additional setup after loading the view, typically from a nib.
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {

    }
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }

    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let roomsVC = segue.destination as! roomsViewController
//        roomsVC.currentUser = sender as? User
//    }


}

