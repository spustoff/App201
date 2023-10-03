//
//  App201App.swift
//  App201
//
//  Created by Вячеслав on 9/30/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_e725QCEddi2Vi6dN8B6XuEFprcyqJx")
        Amplitude.instance().initializeApiKey("b42a7766926506c20b91840fd8f57299")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App201App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
