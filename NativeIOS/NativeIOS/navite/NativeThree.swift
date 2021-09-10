//
//  NaviteTwo.swift
//  NativeIOS
//
//  Created by 杨建 on 2021/8/4.
//

import UIKit

class NativeThreeController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    var data:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "NativeThree"
        self.view.backgroundColor = UIColor.white
        let label = UILabel.init();
        label.frame = CGRect.init(x: 100, y: 200, width: 100, height: 50);
        label.text = String(format: "NativeThree:%@", data)
        self.view.addSubview(label);
        
        self.view.addSubview(setupButtn(title: "NativePushToNativeOnePage", y: 400));
        self.view.addSubview(setupButtn(title: "NativePushToFlutterTwoPage", y: 500));
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
            let naviteFour = NativeFourController()
            self.navigationController?.pushViewController(naviteFour, animated: true)
        } else {
            
        }
          
        
    }

}

