//
//  ListProspectVC.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 21/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import UIKit

class ListProspectVC: BaseCenterVC {

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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detail = segue.destination as! DetailProspectVC
        detail.newClient = sender as! NewClient
        detail.delegate = self
    }
}
extension ListProspectVC:ProspectView{
    func setNewClients(newClients: [NewClient]) {
        self.newClients = newClients
        self.tableView.reloadData()
    }
}

extension ListProspectVC:DetailProspectVCDelegate{
    func reloadNewClients() {
        self.presenter?.getNewClients()
    }
}

extension ListProspectVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newClients.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prospectCell") as! ProspectTableViewCell
        let newClient = self.newClients[indexPath.row]
        cell.newClient = newClient
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let newClient = self.newClients[indexPath.row]
        performSegue(withIdentifier: "detail", sender: newClient)
    }
}
