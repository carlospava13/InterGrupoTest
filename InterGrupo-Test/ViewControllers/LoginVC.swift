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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupPresenter(){
        self.presenter = LoginPresenter(loginView: self)
        if let user = UserManagament.loadUserObject(),user.rememberMe!{
            self.txtEmail.text = user.email
            self.txtPassword.text = user.password
        }
    }
    
    @IBAction func onRememberMe(_ sender: UIButton) {
      sender.isSelected = !sender.isSelected
        rememberMe = sender.isSelected
    }
    
    @IBAction func onLogin(_ sender: Any) {
        if (self.txtEmail.text?.isValidEmail())!{
            self.presenter?.login(email: txtEmail.text!, password: txtPassword.text!)
        }else{
            self.showAlertCustom(title: "Error en validacion", subTitle: "no es valido este correo")
        }
    }
    
    func showAlertCustom(title:String,subTitle:String){
        let alert = UIAlertController(title:title, message: subTitle, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

extension LoginVC:LoginView{
    func loginError(error: NSError) {
        print(error)
        self.showAlertCustom(title: "Error", subTitle: error.domain)
    }
    
    func showProspects() {
        let appDelegate =  UIApplication.shared.delegate as? AppDelegate
        appDelegate?.setMenu()
    }
}
