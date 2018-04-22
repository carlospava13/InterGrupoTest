//
//  LeftMenu.swift
//  QuickTeam
//
//  Created by Carlos Pava on 12/2/17.
//  Copyright © 2017 Carlos Pava. All rights reserved.
//

import UIKit

class LeftMenuVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "leftMenu"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.restorationIdentifier = "leftMenu"
    }
    
    private let cellidetifier = "leftmenu"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func logOut(){
        let alert = UIAlertController(title: "¿Deseas cerrar sesión?", message: "", preferredStyle: .alert)
        let done = UIAlertAction(title: "Cerrar sesión", style: .default) { (action) in
            self.showLoginVC()
        }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(done)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showLoginVC(){
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let login = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        login.modalTransitionStyle = .crossDissolve
        self.present(login, animated: true) {
            UserManagament.saveUserObject(anUser: nil)
        }
    }
}


extension LeftMenuVC:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ConfigurationMenu.menuItemsForPlayer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellidetifier, for: indexPath) as! LeftMenuTableViewCell
        cell.labMenuItem.text = ConfigurationMenu.getItemFromIndex(index: indexPath.row).menuItemText
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = ConfigurationMenu.getItemFromIndex(index: indexPath.row).item
        switch item {
        case .propects?:
            break
        case .logout?:
            self.logOut()
            break
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
        self.evo_drawerController?.closeDrawerGestureModeMask = .bezelPanningCenterView
        self.evo_drawerController?.closeDrawer(animated: true, completion: nil)
    }
    
}

