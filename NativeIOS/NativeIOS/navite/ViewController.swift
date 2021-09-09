//
//  ViewController.swift
//  NativeIOS
//
//  Created by 杨建 on 2021/8/4.
//

import UIKit
import flutter_boost

class ViewController: UIViewController {
    
    var returnData:String = ""
    
//    //添加自定义回调事件后获取的回调，用于在deinit中remove监听器
    var removeListener:FBVoidCallback?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
//        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated);
//        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NativeOne"
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(setupButtn(title: "NativePushToFlutterOnePage", y: 150));
        self.view.addSubview(setupButtn(title: "NativePushToFlutterTwoPage", y: 200));
        self.view.addSubview(setupButtn(title: "NativePushToNativePage", y: 250));
        
        addEventListener()
        
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
            let options = FlutterBoostRouteOptions()
            options.pageName = "homePage"
            options.arguments = ["message" :"我是Navite数据 啦啦啦啦"]
//            options.opaque = false
            //这个是push操作完成的回调，而不是页面关闭的回调！！！！
            options.completion = { completion in
                print("打开Flutter页面了")
                print("open operation is completed")
            }
            
            //这个是页面关闭并且返回数据的回调，回调实际需要根据您的Delegate中的popRoute来调用
            options.onPageFinished = { dic in
                print("Flutter页面关闭回调了")
                print(dic as Any)
            }

            FlutterBoost.instance().open(options)            
        } else if(btn.tag == 200) {
            let options = FlutterBoostRouteOptions()
            options.pageName = "flutterOnePage"
            options.arguments = ["message" :"我是Navite数据 HelloWMai"]
            options.opaque = true
            //这个是push操作完成的回调，而不是页面关闭的回调！！！！
            options.completion = { completion in
                print("打开Flutter页面了")
                print("open operation is completed")
            }
            
            //这个是页面关闭并且返回数据的回调，回调实际需要根据您的Delegate中的popRoute来调用
            options.onPageFinished = { dic in
                print("Flutter页面关闭回调了")
                print(dic as Any)
                if let data = dic?["data"] as? String{
                    self.resultLabel.text = "return data is: \(data)"
                }
            }

            FlutterBoost.instance().open(options)
        } else {
            let naviteTwo = NativeTwoController()
            self.navigationController?.pushViewController(naviteTwo, animated: true)
        }
    }
    
    private func addEventListener(){
            //注册自定义事件监听,回调闭包中面要用weak self，否则会有循环引用
        //removeListener->self->removeListener
        self.removeListener =  FlutterBoost.instance().addEventListener({[weak self] key, dic in
            //在回调中文本的值代表flutter向native传值成功
            if let data = dic?["data"] as? String{
                self?.resultLabel.text = "return data is: \(data)"
            }
        }, forName: "event")
    }

    deinit {
        //解除注册，避免内存泄漏
        self.removeListener?()
    }
    
    lazy var resultLabel: UILabel = {
            let resultLabel = UILabel()
            resultLabel.text = "return data is: "
            return resultLabel
        }()
}

