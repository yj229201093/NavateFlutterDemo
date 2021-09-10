//
//  AppDelegate.swift
//  NativeIOS
//
//  Created by 杨建 on 2021/8/4.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var flutterEngine: FlutterEngine?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        self.initFlutterEngine();
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        let rootVC = ViewController();
        let navigationViewController = UINavigationController(rootViewController: rootVC)
        self.window?.rootViewController = navigationViewController
        return true
    }
    
    
    func initFlutterEngine() {
        flutterEngine = FlutterEngine.init(name: "FlutterEngine")
        flutterEngine?.run();
        GeneratedPluginRegistrant .register(with: flutterEngine!)
    }
    
    

}

