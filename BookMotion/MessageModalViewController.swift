//
//  MessageModalViewController.swift
//  BookMotion
//
//  Created by 北野めぐみ on 2019/10/21.
//  Copyright © 2019年 kitano kaito. All rights reserved.
//

import UIKit

class MessageModalViewController: UIViewController {
  @IBOutlet weak var message: UILabel!
  @IBOutlet weak var btn: UIButton!
  @IBOutlet weak var messageView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
    messageView.layer.cornerRadius = 20
    messageView.layer.masksToBounds = true
    message.text = "あなたの木が一つ大きくなりました！\n積ん読せず、枯れないようにしましょう！"
    btn.backgroundColor = UIColor(displayP3Red: 50/255, green: 230/255, blue: 100/255, alpha: 0.8)
    btn.layer.cornerRadius = 10
    btn.layer.masksToBounds = true
  }
  
  @IBAction func btnAction(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
}
