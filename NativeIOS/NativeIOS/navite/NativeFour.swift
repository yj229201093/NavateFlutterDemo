//
//  NaviteTwo.swift
//  NativeIOS
//
//  Created by 杨建 on 2021/8/4.
//

import UIKit
import flutter_boost

class NativeFourController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.navigationBar.isHidden = true
    }
    
    var data:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NativeFour"
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = UIColor.white
        let label = UILabel.init();
        label.frame = CGRect.init(x: 100, y: 200, width: 100, height: 50);
        label.text = String(format: "NativeFour:%@", data)
        self.view.addSubview(label);
        
        self.view.addSubview(setupButtn(title: "NativePopToRootPage", y: 400));
        self.view.addSubview(setupButtn(title: "NativePopPage", y: 500));
    }
    
    func setupButtn(title:String, y:Double) -> UIButton {
        let btn = UIButton()
        let rect = CGRect(x: 100, y: y, width: 300, height: 49)
        btn.frame = rect
        btn.setTitle(title, for: .normal)
        btn.tag = Int(y);
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.addTarget(self, action: #selector(clickPushToNextPage(_:)), for: .touchUpInside)
    
        return btn
    }
    
    @objc func clickPushToNextPage(_ btn:UIButton){
        print("点击");
        if(btn.tag == 400) {
            self.navigationController?.popToRootViewController(animated: true);
        } else {
            self.navigationController?.popViewController(animated: true);
//            let options = FlutterBoostRouteOptions()
//            options.pageName = "flutterOnePage"
//            options.arguments = ["我是key" :"我是value"]
//            options.opaque = true
//            //这个是push操作完成的回调，而不是页面关闭的回调！！！！
//            options.completion = { completion in
//                print("打开Flutter页面了")
//                print("open operation is completed")
//            }
            
//            //这个是页面关闭并且返回数据的回调，回调实际需要根据您的Delegate中的popRoute来调用
//            options.onPageFinished = { dic in
//                print("Flutter页面关闭回调了")
//                print(dic as Any)
//            }
//
//            FlutterBoost.instance().open(options)
        }
          
        
    }
    

}

