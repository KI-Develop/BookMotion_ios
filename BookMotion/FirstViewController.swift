//
//  FirstViewController.swift
//  BookMotion
//
//  Created by 北野めぐみ on 2019/10/16.
//  Copyright © 2019年 kitano kaito. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class FirstViewController: UIViewController {
  @IBOutlet weak var plantHP: MBCircularProgressBarView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    plantHP.value = 0
    plantHP.maxValue = 100

  }

  @IBAction func plant(_ sender: Any) {
    UIView.animate(withDuration: 1.0) {
      self.plantHP.value += 1
    }
  }
  
}

