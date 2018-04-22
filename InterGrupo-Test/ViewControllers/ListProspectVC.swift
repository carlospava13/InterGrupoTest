//
//  ListProspectVC.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 21/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import UIKit

class ListProspectVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var presenter:ProspectPresenter?
    
    private var newClients = [NewClient]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableViewCell()
        self.setupPresenter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupPresenter(){
        self.presenter = ProspectPresenter(prospectView: self)
        self.presenter?.getListProspect()
    }
    
    func setupTableViewCell(){
        let nib = UINib(nibName: "ProspectTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "prospectCell")
    }
}
extension ListProspectVC:ProspectView{
    func setNewClients(newClients: [NewClient]) {
        self.newClients = newClients
        self.tableView.reloadData()
    }
}

extension ListProspectVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newClients.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prospectCell") as! ProspectTableViewCell
        let newClient = self.newClients[indexPath.row]
        cell.labName.text = newClient.name!
        cell.labAddress.text = newClient.address!
        return cell
    }
}
