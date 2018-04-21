//
//  UserManagement.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 21/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import Foundation
struct UserManagament {
    
    static func saveUserObject(anUser: User){
        let defaults = UserDefaults.standard
        let savedData = NSKeyedArchiver.archivedData(withRootObject: anUser)
        defaults.set(savedData, forKey: "user")
        defaults.synchronize()
    }
    
    static func loadUserObject() -> User?{
        let defaults = UserDefaults.standard
        guard let data = defaults.data(forKey: "user"),let user = NSKeyedUnarchiver.unarchiveObject(with: data) else{
            return nil
        }
        return user as? User    
    }
}
