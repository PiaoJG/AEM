//
//  LoginView.swift
//  爱耳目2
//
//  Created by Peter on 17/3/13.
//  Copyright © 2017年 Peter. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
    @IBOutlet weak var userID: UITextField!

    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //点击空白
    @IBAction func tap(_ sender: Any) {
        userID.resignFirstResponder()
        password.resignFirstResponder()
    }
    //返回
    @IBAction func backBtn(_ sender: Any) {
        userID.resignFirstResponder()
        password.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }



}
