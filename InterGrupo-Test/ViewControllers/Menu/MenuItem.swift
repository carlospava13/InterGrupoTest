//
//  MenuItem.swift
//  QuickTeam
//
//  Created by carlos pava on 9/04/18.
//  Copyright © 2018 Carlos Pava. All rights reserved.
//

import UIKit


enum Item {
    case propects
    case logout
}

struct MenuItem {
    var menuItemText:String!
    var item:Item!
}

struct ConfigurationMenu{
    
    static var menuItemsForPlayer:[MenuItem] = [
        MenuItem(menuItemText: "Prospect", item: .propects),
        MenuItem(menuItemText: "Cerrar sesión",item: .logout)
    ]
    
   static func getItemFromIndex(index:Int) -> MenuItem{
        return menuItemsForPlayer[index]
    }
}

