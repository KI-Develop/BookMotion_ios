//
//  WaterModalViewController.swift
//  BookMotion
//
//  Created by 北野めぐみ on 2019/10/22.
//  Copyright © 2019年 kitano kaito. All rights reserved.
//

import UIKit

class WaterModalViewController: UIViewController {
  @IBOutlet weak var waterView: UIView!
  @IBOutlet weak var waterLabel: UILabel!
  @IBOutlet weak var stopBtn: UIButton!
  @IBOutlet weak var goBtn: UIButton!
  
  var treePoint = 0
  var userDafaults = UserDefaults.standard
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.65)
    
    waterView.layer.cornerRadius = 20
    waterView.layer.masksToBounds = true
    waterView.backgroundColor = UIColor(displayP3Red: 255/255, green: 255/255, blue: 224/255, alpha: 1.0)
    waterLabel.text = "１００ポイント使って\n水をあげる？"
    stopBtn.backgroundColor = UIColor.lightGray
    stopBtn.layer.cornerRadius = 10
    stopBtn.layer.masksToBounds = true
    
    goBtn.backgroundColor = UIColor.cyan
    goBtn.layer.cornerRadius = 10
    goBtn.layer.masksToBounds = true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    treePoint = userDafaults.integer(forKey: "treePoint")
  }
  
  @IBAction func stop(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  @IBAction func go(_ sender: Any) {
    treePoint -= 100
    userDafaults.set(treePoint, forKey: "treePoint")
    print(userDafaults.integer(forKey: "treePoint"))
    let parentVC = presentingViewController
    parentVC?.view.setNeedsDisplay()
    self.dismiss(animated: true, completion: {
      [presentingViewController] () -> Void in
      // 閉じた時に行いたい処理
      presentingViewController?.viewWillAppear(true)
    })
    
  }
}
