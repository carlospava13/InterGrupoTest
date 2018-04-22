//
//  DetailProspectPresenter.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 22/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import Foundation


struct DetailProspectPresenter {
    
    var detailProspectView:DetailProspectView!
    
    init(detailProspectView:DetailProspectView) {
        self.detailProspectView = detailProspectView
    }
    
    func updateNewClient(id:String,name:String,lastName:String,telephone:String){
        WSProspect.updateNewClient(id: id, name: name, lastName: lastName, telephone: telephone, completion: {
            self.detailProspectView.updatedNewClient()
        })
    }
}

protocol DetailProspectView {
    func updatedNewClient()
}
