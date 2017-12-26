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
    
    var presenter = LoginPresenter()
    var service: UserServicesProtocol?
    var restClient: RestClientProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dependencyInjection()
        handleButtonLoginState(from: presenter)
        handleOnUserAuthentication(from: presenter)
    }

    @IBAction func onTextFieldTextChanged(_ sender: Any) {
        presenter.set(
            userName: userNameTextField.text ?? "",
            password: passwordTextField.text ?? "")
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        presenter.authen(
            with: userNameTextField.text ?? "",
            password: passwordTextField.text ?? "")
    }
}

// MARK:- Compose App Layers

extension LoginViewController {
    
    private func dependencyInjection() {
        self.service = DI.container.resolve(UserServicesProtocol.self)
        self.restClient = DI.container.resolve(RestClientProtocol.self)

        self.service?.restClient = self.restClient
        self.presenter.userServices = self.service
    }
}

// MARK:- Handle ButtonLogin State on Username and Password changed

extension LoginViewController {
    
    private func handleButtonLoginState(from presenter: LoginPresenter?) {
        presenter?.buttonLoginState = { isEnable in
            self.loginButton.isUserInteractionEnabled = isEnable
            self.loginButton.backgroundColor = isEnable ? UIColor.blue : UIColor.lightGray
        }
    }
    
    private func handleOnUserAuthentication(from presenter: LoginPresenter?) {
        presenter?.userAuthenCallback = { result, message in
            if result {
                // navigate to main view controller
            } else {
                let alert = UIAlertController(
                    title: "Error",
                    message: message,
                    preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(
                    UIAlertAction(
                        title: "OK",
                        style: .default,
                        handler: nil)
                )
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

