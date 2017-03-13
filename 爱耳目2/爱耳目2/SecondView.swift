//
//  SecondView.swift
//  爱耳目2
//
//  Created by Peter on 17/3/10.
//  Copyright © 2017年 Peter. All rights reserved.
//

import UIKit

class SecondView: UIViewController,UIScrollViewDelegate {
    
    var tool = ToolView()
    var tjV = TJView()
    var zrV = ZRView()
    var zxV = ZXView()
    var scroll = UIScrollView()
    
    var arr = NSArray()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //MARK: --自定义导航
        //创建自定义导航条
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 64))
        
        //导航条颜色
        navBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //加载到视图
        view.addSubview(navBar)
        
        //标题
        let titLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        titLabel.text = "公共频道";
        titLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        //导航栏组件
        let navItem = UINavigationItem()
        
        navItem.titleView = titLabel
        
        // 创建左侧按钮
        let backBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        backBtn.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        
        backBtn.addTarget(self, action: #selector(backBtnH), for: .touchUpInside)
        
        let leftButton = UIBarButtonItem(customView: backBtn)
        
        // 创建右侧按钮
        let rightButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searBtn))

        
        // 添加左侧、右侧按钮
        navItem.setLeftBarButton(leftButton, animated: false)
        navItem.setRightBarButton(rightButton, animated: false)
    
        // 把导航栏组件加入导航栏
        navBar.pushItem(navItem, animated: false)
        
        // 导航栏添加到view上
        view.addSubview(navBar)
        
        
        
        //MARK: --工具条
        tool = Bundle.main.loadNibNamed("ToolView", owner: self, options: nil)?.first as! ToolView
        
        tool.frame = CGRect(x: 0, y: 64, width: view.bounds.width, height: tool.frame.height)
        
        //设置响应
        tool.Tuijian.addTarget(self, action: #selector(TJBtn), for: .touchUpInside)
        tool.Zuire.addTarget(self, action: #selector(ZRBtn), for: .touchUpInside)
        tool.Zuixin.addTarget(self, action: #selector(ZXBtn), for: .touchUpInside)
        
        
        view.addSubview(tool)

        arr = [tjV.view,zrV.view,zxV.view]
        
        //创建滚动视图
        scroll.frame = CGRect(x: 0, y: 114, width: view.bounds.width, height: view.bounds.height - 114)
        
        //代理
        scroll.delegate = self;
        
        //加载到视图
        view.addSubview(scroll)
        
        //内容尺寸
        scroll.contentSize = CGSize(width: view.bounds.width * CGFloat(arr.count), height: view.bounds.height - 114)
        
        //按页滚动
        scroll.isPagingEnabled = true
        scroll.scrollsToTop = false
        
        for  i in 0..<arr.count {
            //初始化View
            var v1 = UIView()
            
            //与相对应页面相绑定
            v1 = arr[i] as! UIView
            
            //尺寸
            v1.frame = CGRect(x: view.frame.size.width * CGFloat(i), y: 0, width: view.frame.size.width, height: view.frame.size.height - 114)
            
            //加载到滚动视图
            scroll.addSubview(v1)
            
        }
        
        //隐藏滑动条
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        
        
    }
    //导航返回响应
    func backBtnH() {
        self.dismiss(animated: true, completion: nil)
    }
    //导航搜索
    func searBtn() {
        let search = SearchView()
        
        search.modalTransitionStyle = .crossDissolve
        
        self.present(search, animated: true, completion: nil)
        
    }
    
    //MARK: --滚动视图
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //获取滚动页面的下标
        let i = scroll.contentOffset.x / scroll.frame.size.width
        
        switch i {
        case 0:
            tool.Tuijian.setTitleColor(#colorLiteral(red: 0.2405990362, green: 0.6720298529, blue: 0.9667381644, alpha: 1), for: .normal)
            tool.Zuire.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            tool.Zuixin.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            
            UIView.beginAnimations("go", context: nil)
            UIView.setAnimationDuration(0.3)
            
            tool.Tiao.frame.origin.x = 37;
            
            UIView.commitAnimations()
        case 1:
            tool.Tuijian.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            tool.Zuire.setTitleColor(#colorLiteral(red: 0.2405990362, green: 0.6720298529, blue: 0.9667381644, alpha: 1), for: .normal)
            tool.Zuixin.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            
            UIView.beginAnimations("go", context: nil)
            UIView.setAnimationDuration(0.3)
            
            tool.Tiao.frame.origin.x = 147;
            
            UIView.commitAnimations()
        case 2:
            tool.Tuijian.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            tool.Zuire.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            tool.Zuixin.setTitleColor(#colorLiteral(red: 0.2405990362, green: 0.6720298529, blue: 0.9667381644, alpha: 1), for: .normal)
            
            UIView.beginAnimations("go", context: nil)
            UIView.setAnimationDuration(0.3)
            
            tool.Tiao.frame.origin.x = 257;
            
            UIView.commitAnimations()
        default:
            break
        }
    }
    
    
    //MARK: --工具条
    //工具条按钮响应
    func TJBtn() {
        tool.Tuijian.setTitleColor(#colorLiteral(red: 0.2405990362, green: 0.6720298529, blue: 0.9667381644, alpha: 1), for: .normal)
        tool.Zuire.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        tool.Zuixin.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        
        UIView.beginAnimations("go", context: nil)
        UIView.setAnimationDuration(0.3)
        
        tool.Tiao.frame.origin.x = 37;
        
        UIView.commitAnimations()
        
        scroll.scrollRectToVisible(CGRect(x: scroll.frame.size.width * 0, y: 0, width: scroll.frame.size.width, height: scroll.frame.size.height), animated: false)
    }
    func ZRBtn() {
        tool.Tuijian.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        tool.Zuire.setTitleColor(#colorLiteral(red: 0.2405990362, green: 0.6720298529, blue: 0.9667381644, alpha: 1), for: .normal)
        tool.Zuixin.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        
        UIView.beginAnimations("go", context: nil)
        UIView.setAnimationDuration(0.3)
        
        tool.Tiao.frame.origin.x = 147;
        
        UIView.commitAnimations()
        
        scroll.scrollRectToVisible(CGRect(x: scroll.frame.size.width * 1, y: 0, width: scroll.frame.size.width, height: scroll.frame.size.height), animated: false)
    }
    func ZXBtn() {
        tool.Tuijian.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        tool.Zuire.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        tool.Zuixin.setTitleColor(#colorLiteral(red: 0.2405990362, green: 0.6720298529, blue: 0.9667381644, alpha: 1), for: .normal)
        
        UIView.beginAnimations("go", context: nil)
        UIView.setAnimationDuration(0.3)
        
        tool.Tiao.frame.origin.x = 257;
        
        UIView.commitAnimations()
        
        scroll.scrollRectToVisible(CGRect(x: scroll.frame.size.width * 2, y: 0, width: scroll.frame.size.width, height: scroll.frame.size.height), animated: false)
    }

}
