//
//  TJView.swift
//  爱耳目2
//
//  Created by Peter on 17/3/10.
//  Copyright © 2017年 Peter. All rights reserved.
//

import UIKit


class TJView: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var table = UITableView()
    var videoArr = NSMutableArray()
    var aa = Api()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        
        //创建表格
        table = UITableView(frame: view.bounds, style: .plain)
        
        table.scrollsToTop = true
        
        //代理
        table.delegate = self
        table.dataSource = self
        
        table.separatorStyle = .none
        
        //加载到视图
        view.addSubview(table)
        
        //注册单元格
        table.register(UINib(nibName: "MyTableCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        table.mj_header = MJRefreshStateHeader.init(refreshingBlock: {
            self.videoArr.removeAllObjects()
            self.config()
        })
        
        config()
        
        
    }
    
    //MARK: --网络请求
    func config() {
        
        table.mj_header.beginRefreshing()
        
        Netwroking.shareInstance().request(withURL: aa.VideoURL, params: nil, successBlock: { (block) in
            
            let dic = block as? Dictionary<String, Any>
            
            let dicArray:NSArray = dic?["lives"] as! NSArray
            
            self.videoArr = NSMutableArray()
            
            //转模型
            for i in 0..<dicArray.count{
                
                //定义类型
                var dic2 = dicArray[i] as? Dictionary<String, Any>
                
                //创建模型
                let playerModel:Model = Model()

                //解析
                let dd = dic2?["creator"] as? Dictionary<String,Any>
                playerModel.titLabel = dd?["nick"] as! String
                playerModel.Headimage = dd?["portrait"] as! String
                playerModel.imageV = dd?["portrait"] as! String
                
                playerModel.subTitLabel = dic2?["city"] as! String
                
                //解析的模型添加到数组
                self.videoArr.add(playerModel)
                
            }
            
            self.table.mj_header.endRefreshing()
            //刷新表格
            self.table.reloadData()
            
            
        }) { (block) in
            
            
            
        }
        
    }
    //MARK: --表格
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoArr.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = MyTableCell()
        cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableCell
        
        cell.selectionStyle = .none
        
        let mm:Model = videoArr[indexPath.row] as! Model
        
        //名字
        cell.TitLabel.text = mm.titLabel
        
        //图片
        let url:NSURL = NSURL(string: mm.imageV)!

        cell.ImageV.sd_setImage(with: url as URL, placeholderImage: nil)
        cell.HeadImageV.sd_setImage(with: url as URL, placeholderImage: nil)
        
        cell.HeadImageV.layer.cornerRadius = cell.HeadImageV.frame.width * 0.5
        cell.HeadImageV.layer.masksToBounds = true
        cell.HeadImageV.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1).cgColor
        cell.HeadImageV.layer.borderWidth = 2
        
        //城市
        if case 0 = Int(mm.subTitLabel.lengthOfBytes(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))) {
            cell.SubTitLabel.text = "火星"
        } else {
            cell.SubTitLabel.text = mm.subTitLabel
        }
        
        cell.LiveLabel.layer.cornerRadius = cell.LiveLabel.frame.height * 0.4
        cell.LiveLabel.layer.masksToBounds = true
        cell.LiveLabel.layer.borderWidth = 1
        cell.LiveLabel.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1).cgColor
        
        
        return cell
        
        
    }
    

}
