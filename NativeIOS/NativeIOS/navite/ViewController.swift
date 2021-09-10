//
//  ViewController.swift
//  NativeIOS
//
//  Created by 杨建 on 2021/8/4.
//

import UIKit
import Flutter

class ViewController: UIViewController, FlutterBinaryMessenger {
    func send(onChannel channel: String, message: Data?) {
        <#code#>
    }
    
    func send(onChannel channel: String, message: Data?, binaryReply callback: FlutterBinaryReply? = nil) {
        <#code#>
    }
    
    func setMessageHandlerOnChannel(_ channel: String, binaryMessageHandler handler: FlutterBinaryMessageHandler? = nil) -> FlutterBinaryMessengerConnection {
        <#code#>
    }
    
    func cleanupConnection(_ connection: FlutterBinaryMessengerConnection) {
        <#code#>
    }
    
    
    var returnData:String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NativeOne"
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(setupButtn(title: "NativePushToFlutterOnePage", y: 150));
        self.view.addSubview(setupButtn(title: "NativePushToFlutterTwoPage", y: 200));
        self.view.addSubview(setupButtn(title: "NativePushToNativePage", y: 250));
        
        
        self.view.addSubview(resultLabel)
        self.resultLabel.frame = CGRect.init(x: 100, y: 400, width: 300, height: 50);
    }
    
    func setupButtn(title:String, y:Double) -> UIButton {
        let btn = UIButton()
        let rect = CGRect(x: 50, y: y, width: 300, height: 49)
        btn.frame = rect
        btn.setTitle(title, for: .normal)
        btn.tag = Int(y);
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.addTarget(self, action: #selector(clickPushToNextPage(_:)), for: .touchUpInside)
        return btn
    }
    
    @objc func clickPushToNextPage(_ btn:UIButton){
        print("点击");
        if(btn.tag == 150) {
            let flutterVc = FlutterViewController.init(engine: self.getFlutterEngine(), nibName: nil, bundle: nil);
            self.navigationController?.pushViewController(flutterVc, animated: true)
        } else if(btn.tag == 200) {
            
        } else {
            let naviteTwo = NativeTwoController()
            self.navigationController?.pushViewController(naviteTwo, animated: true)
        }
    }
    
 
    
    lazy var resultLabel: UILabel = {
            let resultLabel = UILabel()
            resultLabel.text = "return data is: "
            return resultLabel
        }()
    
    
    func  getFlutterEngine() -> FlutterEngine {
        let flutterEngine:FlutterEngine;
        let app:AppDelegate = UIApplication.shared.delegate! as! AppDelegate
        flutterEngine = app.flutterEngine!
        return flutterEngine
    }
    
    
    func initMethodChannel() {
//        let methodChannel:FlutterMethodChannel = FlutterMethodChannel.init(name: "test", binaryMessenger: self)
//        methodChannel.setMethodCallHandler { call:FlutterMethodCall, @escaping FlutterResult in
//
//        }
        
    }

}

