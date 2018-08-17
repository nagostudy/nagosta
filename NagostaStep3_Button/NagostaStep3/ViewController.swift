//
//  ViewController.swift
//  Nagosta
//
//  Created by hiroyuki.kawai on 2018/06/27.
//  Copyright © 2018年 hiroyuki.kawai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = "なごスタでおしゃべりアプリ"
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        self.label.text = "ボタンを押しました"
    }
}

