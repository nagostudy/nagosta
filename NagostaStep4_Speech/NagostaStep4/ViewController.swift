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
    
    private let speaker = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = "なごスタでおしゃべりアプリ"
        print(AVSpeechSynthesisVoice.speechVoices())

    }
    
    func say(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        // Siriの音声（シミュレータでは発音不可）
        //        utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.siri_female_ja-JP_compact")
        self.speaker.speak(utterance)
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        self.label.text = "ボタンを押しました"
        say("ボタンを押しました。")
    }
}

