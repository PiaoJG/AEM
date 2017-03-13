//
//  ViewController.swift
//  爱耳目2
//
//  Created by Peter on 17/3/9.
//  Copyright © 2017年 Peter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建图片
        let imageView = UIImageView(image: #imageLiteral(resourceName: "desk_002"))
        
        //图片尺寸
        imageView.frame = view.bounds;
        
        //在加到界面
        view.addSubview(imageView)
        
        //标题
        let titLabel = UILabel(frame: CGRect(x: (view.frame.width - 300)/2, y: 120, width: 300, height: 35))
        
        //标题内容
        titLabel.text = "爱耳目智能摄像机";
        
        //居中
        titLabel.textAlignment = .center;
        
        //字体颜色
        titLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        titLabel.font = UIFont.systemFont(ofSize: 24, weight: 2)
        
        //加载到视图
        view.addSubview(titLabel)
        
        //创建登录按钮
        let SigntBtn = UIButton(frame: CGRect(x: (view.frame.width - 300)/2, y: view.frame.height - 100, width: 300, height: 35))
        
        SigntBtn.setTitle("登录", for: .normal)
        SigntBtn.addTarget(self, action: #selector(Login), for: .touchUpInside)
        SigntBtn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        view.addSubview(SigntBtn)
        
        //创建注册按钮
        let CreateBtn = UIButton(frame: CGRect(x: (view.frame.width - 300)/2, y: SigntBtn.frame.origin.y - 35 - 10, width: 300, height: 35))
        
        CreateBtn.setTitle("快速注册", for: .normal)
        CreateBtn.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        
        CreateBtn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        view.addSubview(CreateBtn)
        
        //创建随便看看按钮
        let lookBtn = UIButton(frame: CGRect(x: CreateBtn.bounds.origin.x + 240, y: view.frame.height - 50 , width: 100, height: 35))
        
        lookBtn.setTitle("随便看看>", for: .normal)
        lookBtn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        lookBtn.addTarget(self, action: #selector(lookBB), for: .touchUpInside)
        
        
        view.addSubview(lookBtn)
        
    }
    func Login() {
        let log = LoginView()
        
        self.present(log, animated: true, completion: nil)
        
    }
    func lookBB() {

        self.present(SecondView(), animated: true, completion: nil)
        
    }


}

