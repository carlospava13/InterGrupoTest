//
//  Constants.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 21/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import Foundation
let urlBase = "http://directotesting.igapps.co/"

struct Constants {
    static let urlLogin = "/application/login/"
    
    static func urlLogin (email:String, password:String) -> String{
        return urlBase + Constants.urlLogin + "?email=\(email)&password=\(password)"
    }
}
