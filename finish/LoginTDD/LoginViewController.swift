//
//  ViewController.swift
//  LoginTDD
//
//  Created by Olarn U. on 20/12/2560 BE.
//  Copyright © 2560 Olarn U. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func onTextFieldTextChanged(_ sender: Any) {
        let txt = sender as! UITextField
        print(txt.text ?? "undefine")
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
    }
    
}

