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
  @IBOutlet weak var plantBtn: UIButton!
  @IBOutlet weak var treeImg: UIImageView!
  
  let animationDuration: TimeInterval = 2.0
  
  let images = [UIImage(named:"tree_seichou01")!,
                UIImage(named:"tree_seichou02")!,
                UIImage(named:"tree_seichou03")!,
                UIImage(named:"tree_seichou04")!,
                UIImage(named:"tree_seichou05")!,
                UIImage(named:"tree_seichou06")!,
                UIImage(named:"tree_seichou07")!,
                UIImage(named:"tree_seichou08")!,
                UIImage(named:"tree_seichou09")!,
                UIImage(named:"tree_seichou10")!]
  var index = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    animateImageView()
    
    treeImg.image = images[0]
    plantHP.value = 0
    plantHP.maxValue = 100
    plantBtn.backgroundColor = UIColor(displayP3Red: 50/255, green: 230/255, blue: 100/255, alpha: 0.8)
    plantBtn.layer.cornerRadius = 10
    plantBtn.layer.masksToBounds = true

  }
  
  func animateImageView() {
    print(2)
    CATransaction.begin()
    CATransaction.setAnimationDuration(animationDuration)
    
    let transition = CATransition()
    transition.type = CATransitionType.fade
    treeImg.layer.add(transition, forKey: kCATransition)
    treeImg.image = images[index]
  
    CATransaction.commit()
    index = index < images.count - 1 ? index + 1 : 0
  }

  @IBAction func plant(_ sender: Any) {
    UIView.animate(withDuration: 1.0) {
      self.plantHP.value += 20.0
    }
    if(self.plantHP.value == 100){
      self.animateImageView()
      self.plantHP.value = 0
    }
  }
}

