//
//  UIViewController.swift
//  NativeIOS
//
//  Created by 杨建 on 2021/8/6.
//

import UIKit



extension UIViewController {
    
    func popGestureClose() {
        if let ges = self.navigationController?.interactivePopGestureRecognizer?.view?.gestureRecognizers {
            for item in ges {
                item.isEnabled = false
            }
        }
    }
    
    func popGestureOpen() {
        if let ges = self.navigationController?.interactivePopGestureRecognizer?.view?.gestureRecognizers {
            for item in ges {
                item.isEnabled = false
            }
        }
    }
}
