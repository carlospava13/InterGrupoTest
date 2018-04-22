//
//  User.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 21/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import UIKit
import SwiftyJSON
class User: NSObject, NSCoding {
    
    var authToken: String?
    var email: String?
    var password:String?
    var rememberMe:Bool?
    
    required init(authToken: String,email: String,password:String,rememberMe:Bool) {
        self.authToken = authToken
        self.email = email
        self.password = password
        self.rememberMe = rememberMe
    }
    
    required convenience init(json:JSON,password:String,rememberMe:Bool) {
        let token = json["authToken"].string
        let email = json["email"].string
        self.init(authToken: token!, email: email!,password:password,rememberMe:rememberMe)
    }
    
    // MARK: NSCoding
    
    required convenience init?(coder decoder: NSCoder) {
        guard let authToken = decoder.decodeObject(forKey: "authToken") as? String,
            let email = decoder.decodeObject(forKey: "email") as? String,
            let password = decoder.decodeObject(forKey: "password") as? String,
            let rememberMe = decoder.decodeObject(forKey: "rememberMe") as? Bool
            else { return nil }
        
        self.init(authToken: authToken, email: email,password: password,rememberMe: rememberMe)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.authToken != nil ? self.authToken!: nil, forKey: "authToken")
        aCoder.encode(self.email!, forKey: "email")
        aCoder.encode(self.password!, forKey: "password")
        aCoder.encode(self.rememberMe,forKey:"rememberMe")
    }
    
}
