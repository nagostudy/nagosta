//
//  ViewController.swift
//  Nagosta
//
//  Created by hiroyuki.kawai on 2018/06/27.
//  Copyright © 2018年 hiroyuki.kawai. All rights reserved.
//
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let speaker = AVSpeechSynthesizer()
    
    // 画面が読み込まれたとき
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = "なごスタでおしゃべりアプリ"
    }
    
    // 発音する
    // _ を引数名の前につけると、呼び出すときに引数名（text:）を書かなくてよい
    func say(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        // 補足: Siriの音声（シミュレータでは発音不可）
        // utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.siri_female_ja-JP_compact")
        self.speaker.speak(utterance)
    }
    
    // ボタンを押したとき
    @IBAction func buttonTap(_ sender: Any) {
        self.label.text = "ボタンを押しました"
        // テキストフィールドに文字列があれば、say()を実行する
        if let text = self.textField.text {
            say(text)
        }
    }
    
    // キーボードの改行(Return)を押したとき、キーボードを閉じるため
    @IBAction func textFieldDidEndOnExit(_ sender: Any) {
        say("キーボードを閉じました")
    }
}
