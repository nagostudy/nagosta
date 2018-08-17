//
//  ViewController.swift
//  Nagosta
//
//  Created by hiroyuki.kawai on 2018/06/27.
//  Copyright © 2018年 hiroyuki.kawai. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    private let speaker = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = "なごスタでおしゃべりアプリ"
        self.button.layer.cornerRadius = 5
        self.textField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        say("なごスタへようこそ！")
    }
    
    func say(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        // Siriの音声（シミュレータでは発音不可）
        //        utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.siri_female_ja-JP_compact")
        self.speaker.speak(utterance)
    }
    
    /// [【Swift】Dateの王道 【日付】](https://qiita.com/rinov/items/bff12e9ea1251e895306)
    func nowTime() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ja_JP")
        
        let now = Date() // 現在時刻を取得する
        let nowTime = formatter.string(from: now)
        print("\(nowTime)")
        
        return nowTime
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        self.label.text = "ボタンを押しました"
        
        if let text = self.textField.text {
            say(text)
        }
    }
    
    @IBAction func sayTimeButtonTap(_ sender: Any) {
        let now = nowTime()
        say("現在時刻は\(now)です。")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

