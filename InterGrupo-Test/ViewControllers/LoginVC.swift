//
//  LoginVC.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 21/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    var presenter:LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPresenter()
        self.txtEmail.text = "directo@directo.com"
        self.txtPassword.text = "directo123"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupPresenter(){
        self.presenter = LoginPresenter(loginView: self)
       
    }
    
    @IBAction func onLogin(_ sender: Any) {
        self.presenter?.login(email: txtEmail.text!, password: txtPassword.text!)
    }
    @IBAction func onShowUser(_ sender: Any) {
        let user = UserManagament.loadUserObject()
        print(user?.authToken)
    }
}

extension LoginVC:LoginView{
    func loginError(error: NSError) {
        print(error)
    }
    
    func saveToken(token: String) {
        print("\n LOGIN \n")
    }
}
