//
//  LoginPresenter.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 21/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import UIKit

protocol LoginView {
    func loginError(error:NSError)
    func saveToken(token:String)
}


class LoginPresenter: NSObject {

    var loginView:LoginView!
    
     init(loginView:LoginView) {
        self.loginView = loginView
    }
    
    func login(email:String,password:String){
        WSLogin.requestLogin(email: email, password: password) { (error) in
            if (error != nil){
                self.loginView.loginError(error: error!)
            }else{
                self.loginView.saveToken(token: "token")
            }
        }
    }
    
}
