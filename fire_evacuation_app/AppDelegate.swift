//
//  AppDelegate.swift
//  fire_evacuation_app
//
//  Created by Lu on 9/4/2018.
//  Copyright © 2018年 Lu. All rights reserved.
//

import UIKit
import Foundation
import Disk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        do{
            print("Try to save Disk")
            let saveBuilding = Buildings.share.buildings
            try Disk.save(saveBuilding, to: .documents, as: "buildings.json")
            print("Disk Saved")
        }catch {
            print("Error Occured While Saving")
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        do{
            if Disk.exists("buildings.json", in: .documents){
                print("Disk Exist")
                print("Try to load Disk")
                let retrievedBuilding = try Disk.retrieve("buildings.json", from: .documents, as: [Building].self)
                Buildings.share.loadBuilding(retrievedBuilding)
                print("Disk Loaded")
            }else{print("Disk Not Exist")}
        }catch{
            print("Error Occured While Loading")
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

