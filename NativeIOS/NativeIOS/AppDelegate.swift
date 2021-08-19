//
//  AppDelegate.swift
//  NativeIOS
//
//  Created by 杨建 on 2021/8/4.
//

import UIKit
import flutter_boost

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
        //创建代理，做初始化操作
        let delegate = BoostDelegate()
        FlutterBoost.instance().setup(application, delegate: delegate) { engine in
            print("初始化");
            FlutterBoostPlugin.getPlugin(engine);
        }
        
        
        
        let rootVC = ViewController();
    
        let navigationViewController = UINavigationController(rootViewController: rootVC)
        navigationViewController.navigationBar.isHidden = true
        
        self.window?.rootViewController = navigationViewController
        
        delegate.navigationController = navigationViewController
        return true
    }

}

