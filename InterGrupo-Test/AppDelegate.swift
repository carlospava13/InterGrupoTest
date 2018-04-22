//
//  AppDelegate.swift
//  InterGrupo-Test
//
//  Created by carlos pava on 21/04/18.
//  Copyright © 2018 carlos pava. All rights reserved.
//

import UIKit
import DrawerController
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var drawerController: DrawerController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.setRootViewControoller()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }

    func setRootViewControoller(){
        if UserManagament.loadUserObject() != nil{
            self.setMenu()
        }else{
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
        }
    }
    
    func setMenu(){
        let storyBoard = UIStoryboard(name: "Prospect", bundle: nil)
        let center = storyBoard.instantiateViewController(withIdentifier: "ListProspectVC") as! ListProspectVC
        let leftVC = storyBoard.instantiateViewController(withIdentifier: "LeftMenuVC") as! LeftMenuVC
        let navigationController = UINavigationController(rootViewController: center)
        navigationController.restorationIdentifier = "centerMenu"
        
        let leftSideNavController = UINavigationController(rootViewController: leftVC)
        leftSideNavController.restorationIdentifier = "leftMenu"
        
        self.drawerController = DrawerController(centerViewController: navigationController, leftDrawerViewController: leftSideNavController)
        self.drawerController.showsShadows = true
        
        self.drawerController.restorationIdentifier = "Drawer"
        self.drawerController.maximumRightDrawerWidth = 200.0
        self.drawerController.drawerVisualStateBlock = { (drawerController, drawerSide, percentVisible) in
            let block = DrawerVisualStateManager.sharedManager.drawerVisualStateBlock(for: drawerSide)
            block?(drawerController, drawerSide, percentVisible)
        }
        self.window = UIWindow(frame: UIScreen.main.bounds)
    
        self.window?.rootViewController?.modalTransitionStyle = .crossDissolve
        self.window?.rootViewController?.modalPresentationStyle = .custom
        self.window?.makeKeyAndVisible()
        self.window?.backgroundColor = UIColor.white
        
        let snapshot = (UIApplication.shared.keyWindow?.snapshotView(afterScreenUpdates: true))!
        center.view.addSubview(snapshot);
        
        UIApplication.shared.keyWindow?.rootViewController = center
        UIView.transition(with: snapshot, duration: 0.4, options: .transitionCrossDissolve, animations: {
            snapshot.layer.opacity = 0;
            self.window?.rootViewController = self.drawerController
        }, completion: { (status) in
            snapshot.removeFromSuperview()
        })
    }
    
}

