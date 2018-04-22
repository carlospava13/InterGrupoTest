//
//  ProspectTableViewCell.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 21/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import UIKit

class ProspectTableViewCell: UITableViewCell {
    @IBOutlet weak var labName: UILabel!
    @IBOutlet weak var labLasName: UILabel!
    @IBOutlet weak var labId: UILabel!
    @IBOutlet weak var labTelephoneNumber: UILabel!
    
    var newClient:NewClient?{
        willSet{
            self.setNewClientToView(newClient: newValue)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setNewClientToView(newClient:NewClient?){
        self.labName.text = newClient?.name
        self.labLasName.text = newClient?.surname
        self.labId.text = newClient?.id
        self.labTelephoneNumber.text = newClient?.telephone
    }
    
}
