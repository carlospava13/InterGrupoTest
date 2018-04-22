//
//  DetailProspectVC.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 22/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import UIKit

protocol DetailProspectVCDelegate {
    func reloadNewClients()
}


class DetailProspectVC: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtTelephoneNumber: UITextField!
    
    var newClient:NewClient!
    var delegate:DetailProspectVCDelegate?
    var presenter:DetailProspectPresenter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setButtonToNavigationBar()
        self.setNewClientToView()
        self.presenter = DetailProspectPresenter(detailProspectView: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setButtonToNavigationBar(){
        let rigthButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(updateNewClient))
        self.navigationItem.rightBarButtonItem = rigthButton
    }
    
    func setNewClientToView(){
        self.txtName.text = self.newClient.name
        self.txtLastName.text = self.newClient.surname
        self.txtId.text = self.newClient.id
        self.txtTelephoneNumber.text = self.newClient.telephone
    }
    
    @objc func updateNewClient(){
        self.presenter?.updateNewClient(id: self.txtId.text!, name: self.txtName.text!, lastName: self.txtLastName.text!, telephone: self.txtTelephoneNumber.text!)
    }
}

extension DetailProspectVC:DetailProspectView{
    func updatedNewClient() {
        if let delegate = self.delegate{
            delegate.reloadNewClients()
            self.navigationController?.popViewController(animated: true)
        }
    }
}
