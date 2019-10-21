//
//  TreeModalViewController.swift
//  BookMotion
//
//  Created by 北野めぐみ on 2019/10/21.
//  Copyright © 2019年 kitano kaito. All rights reserved.
//

import UIKit

class TreeModalViewController: UIViewController {

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
  
  let animationDuration: TimeInterval = 3.0
  
  var imageIndex = 0
  @IBOutlet weak var treeView: UIView!
  @IBOutlet weak var treeImg: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    treeImg.image = images[imageIndex]
    treeView.layer.cornerRadius = treeView.frame.height / 2.0
    treeView.layer.masksToBounds = true
    
    self.animateImageView()
    //モーダルに見せる為い一つ前のゔviewを透過
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
    //１秒後
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      self.animateImageView()
    }
    //５秒後
    DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
      self.dismiss(animated: true, completion: nil)
    }

  }
  
  func animateImageView() {
    CATransaction.begin()
    CATransaction.setAnimationDuration(animationDuration)
    
    let transition = CATransition()
    transition.type = CATransitionType.fade
    
    treeImg.layer.add(transition, forKey: kCATransition)
    treeImg.image = images[imageIndex]
    
    CATransaction.commit()
    imageIndex += 1
  }

}
