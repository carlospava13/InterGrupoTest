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
    
    @IBOutlet weak var imgStatusCd: UIImageView!
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
        
        let status:Int16 = (newClient?.statusCd)!
        let state = State(state: Int(status))
        let imgState:UIImage!
        switch state {
        case .pending:
            imgState = UIImage(named: "pending")
            break
        case .approved:
            imgState = UIImage(named: "approved")
            break
        case .accepted:
            imgState = UIImage(named: "accepted")
            break
        case .rejected:
            imgState = UIImage(named: "rejected")
            break
        case .disabled:
            imgState = UIImage(named: "disabled")
            break
        }
        
        self.imgStatusCd.image = imgState
    }
    
}
