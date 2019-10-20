//
//  ThirdViewController.swift
//  BookMotion
//
//  Created by 北野めぐみ on 2019/10/20.
//  Copyright © 2019年 kitano kaito. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  var alertController: UIAlertController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  @IBAction func showAlert(_ sender: Any) {
    alert(title: "リスト作成", message: "リスト名を入力してください")
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 8
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let bookCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath)
    bookCell.backgroundColor = .red
    
    return bookCell
  }
  func alert(title:String, message:String) {
    alertController = UIAlertController(title: title,
                                        message: message,
                                        preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK",
                                            style: .default,
                                            handler: nil))
    alertController.addAction(UIAlertAction(title: "Cencel",
                                            style: .default,
                                            handler: nil))
    present(alertController, animated: true)
  }
  

}
