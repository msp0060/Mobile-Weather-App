//
//  Mobile_Weather_AppApp.swift
//  Mobile Weather App
//
//  Modified by Michael Peek from code Created by Stewart Lynch on 2021-01-18.
//  Prior code was based on an older API and JSON file no longer available.
//  Additional features and information were added available from the newer API's.
//  Example weather is shown every 3 hours with a time stamp as well and added wind speed.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Weather_App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
