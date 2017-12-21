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
    
    let presenter = LoginPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleButtonLoginState(from: presenter)
    }

    @IBAction func onTextFieldTextChanged(_ sender: Any) {
        presenter.set(
            userName: userNameTextField.text ?? "",
            password: passwordTextField.text ?? "")
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        print("Login Button Tapped")
    }
}

// MARK:- Handle ButtonLogin State on Username and Password changed

extension LoginViewController {
    
    func handleButtonLoginState(from presenter: LoginPresenter) {
        presenter.buttonLoginState = { isEnable in
            self.loginButton.isUserInteractionEnabled = isEnable
            self.loginButton.backgroundColor = isEnable ? UIColor.blue : UIColor.lightGray
        }
    }
    
}

