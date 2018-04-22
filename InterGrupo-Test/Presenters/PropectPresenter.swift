//
//  PropectPresenter.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 21/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import Foundation

protocol ProspectView {
    func setNewClients(newClients:[NewClient])
}


class ProspectPresenter: NSObject {
    
    var prospectView:ProspectView!
    
    init(prospectView:ProspectView) {
        self.prospectView = prospectView
    }
    
    func getListProspect(){
      let user = UserManagament.loadUserObject()
        WSProspect.getLisProspect(token: user!.authToken!) { (error) in
            self.getNewClients()
        }
    }
    
    func getNewClients(){
       let newClients = WSProspect.getNewClientsFromDB()
        self.prospectView.setNewClients(newClients: newClients)
    }
}
