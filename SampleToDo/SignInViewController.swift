//
//  SignInViewController.swift
//  SampleToDo
//
//  Created by cmStudent on 2021/06/20.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.sginInViewController = self
    }
    
    func nextController() {
        
        let user = Firebase.Auth.auth().currentUser?.displayName
        
        UserDefaults.standard.setValue(user, forKey: "userName")
        
        print(UserDefaults.standard.object(forKey: "userName")!)
        
        let navigation = storyboard!.instantiateViewController(withIdentifier: "navigationViewController") as! UINavigationController
        
        navigation.modalPresentationStyle = .fullScreen
        
        self.present(navigation, animated: true)
        
    }

}
