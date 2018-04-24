//
//  Constants.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 21/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import Foundation
let urlBase = "http://directotesting.igapps.co/"
var rememberMe = false
struct Constants {
    static let urlLogin = "/application/login/"
    static let urlPropects = "sch/prospects.json"
    static func urlLogin (email:String, password:String) -> String{
        return urlBase + Constants.urlLogin + "?email=\(email)&password=\(password)"
    }
}

enum State:Int{
    case pending = 0
    case approved = 1
    case accepted = 2
    case rejected = 3
    case disabled = 4
    
    init(state n: Int) {
        if n == 0 { self = .pending }
        else if n < 1 { self = .approved }
        else if n < 2 { self = .accepted }
        else if n < 3 { self = .rejected }
        else { self = .disabled }
    }
    
}
