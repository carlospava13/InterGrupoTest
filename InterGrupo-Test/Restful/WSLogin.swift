//
//  WSLogin.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 21/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class WSLogin: NSObject {

    static func requestLogin(email:String,password:String,completion:@escaping(_ error:NSError?)->()){
        Alamofire.request(Constants.urlLogin(email: email, password: password)).responseJSON { (response) in
            switch response.result{
            case .success(let success):
                if response.response?.statusCode == 200{
                    let json = JSON(success)
                    let user = User(json: json,password:password,rememberMe:rememberMe)
                    UserManagament.saveUserObject(anUser: user)
                    completion(nil)
                }else{
                    completion(NSError(domain: "error en login", code: (response.response?.statusCode)!, userInfo: nil))
                }
             
                break
            case .failure(let error):
                completion(error as NSError)
                break
            }
        }
    }
}
