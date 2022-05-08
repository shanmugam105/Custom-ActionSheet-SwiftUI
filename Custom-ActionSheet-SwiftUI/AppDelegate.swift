//
//  AppDelegate.swift
//  Custom-ActionSheet-SwiftUI
//
//  Created by Mac on 08/05/22.
//

import Foundation
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        // Initial setup
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIHostingController(rootView: HomeContentView())
        window?.makeKeyAndVisible()
        return true
    }
}
