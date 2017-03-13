//
//  SearchView.swift
//  爱耳目2
//
//  Created by Peter on 17/3/13.
//  Copyright © 2017年 Peter. All rights reserved.
//

import UIKit

class SearchView: UIViewController {
    @IBOutlet weak var navView: UIView!

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.becomeFirstResponder()
        
    }
    //取消按钮
    @IBAction func backBtn(_ sender: Any) {
        searchBar.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
    //点击空白
    @IBAction func tap(_ sender: Any) {
        searchBar.resignFirstResponder()
    }

    

}
