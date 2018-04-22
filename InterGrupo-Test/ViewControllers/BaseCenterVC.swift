//
//  BaseCenterVC.swift
//  QuickTeam
//
//  Created by carlos pava on 9/04/18.
//  Copyright © 2018 Carlos Pava. All rights reserved.
//

import UIKit

class BaseCenterVC: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.restorationIdentifier = "centerMenu"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.restorationIdentifier = "centerMenu"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLeftMenuButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLeftMenuButton() {
        let btnMenu = UIImage(named:"iconMenu")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: btnMenu, style: .plain, target: self, action: #selector(leftDrawerButtonPress(_:)))
    }
    
    @objc func leftDrawerButtonPress(_ sender: AnyObject?) {
        self.evo_drawerController?.toggleDrawerSide(.left, animated: true, completion: nil)
    }

}
