//
//  AppDelegate.swift
//  appDemo
//
//  Created by youssef osama on 15/01/1402 AP.
//
import GoogleSignIn
import Firebase
import FacebookCore
import FBSDKCoreKit
import UIKit




@main
class AppDelegate: UIResponder, UIApplicationDelegate{

// 82538688658-7svjqjs4v53v8kvh14q2jontlro5keem.apps.googleusercontent.com

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )

        	/*
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
          if error != nil || user == nil {
              print("delegate")
            print(error)
          } else {
            print(user)
          }
        }
        */
        return true
    }
    
   
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(
      _ app: UIApplication,
      open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        
        
        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
         
        /*
        let handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
          return true
        }
         */

      // Handle other custom URL types.

      // If not handled by this app, return false.
      
    }

    
   
    // MARK: UISceneSession Lifecycle


    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

