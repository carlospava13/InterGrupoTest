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

    
    required init(authToken: String,email: String) {
        self.authToken = authToken
        self.email = email
    }
    
    required convenience init(json:JSON) {
        let token = json["authToken"].string
        let email = json["email"].string
        self.init(authToken: token!, email: email!)
    }
    
    // MARK: NSCoding
    
    required convenience init?(coder decoder: NSCoder) {
        guard let authToken = decoder.decodeObject(forKey: "authToken") as? String,
            let email = decoder.decodeObject(forKey: "email") as? String
            else { return nil }
        
        self.init(authToken: authToken, email: email)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.authToken!, forKey: "authToken")
        aCoder.encode(self.email!, forKey: "email")
    }
    
}
