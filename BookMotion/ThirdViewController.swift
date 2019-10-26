//
//  ThirdViewController.swift
//  BookMotion
//
//  Created by 北野めぐみ on 2019/10/20.
//  Copyright © 2019年 kitano kaito. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  @IBOutlet weak var bookCollection: UICollectionView!
  
  var userdefaults = UserDefaults.standard
  var alertController: UIAlertController!
  var listNum = 1
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
    userdefaults.register(defaults: ["listNum": listNum])
    let cellLayout = UICollectionViewFlowLayout()
    cellLayout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    
    bookCollection.collectionViewLayout = cellLayout
  }
  
  override func viewWillAppear(_ animated: Bool) {
    listNum = userdefaults.integer(forKey: "listNum")
  }
  
  @IBAction func showAlert(_ sender: Any) {
    alert(title: "リスト作成", message: "リスト名を入力してください")
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return listNum
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let bookCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath)
    bookCell.layer.borderColor = UIColor.red.cgColor
    bookCell.layer.borderWidth = 6
    bookCell.layer.cornerRadius = 6
    bookCell.layer.masksToBounds = true
    
    return bookCell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let horizontalSpace : CGFloat = 30
    let cellSize : CGFloat = self.view.bounds.width / 2 - horizontalSpace
    return CGSize(width: cellSize, height: cellSize)
  }
  
  func alert(title:String, message:String) {
    alertController = UIAlertController(title: title,message: message,preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK",style: .default,handler: {
      (action: UIAlertAction!) in
      if self.listNum < 8 {
        self.listNum += 1
        self.userdefaults.set(self.listNum, forKey: "listNum")
      }
    }))
    alertController.addAction(UIAlertAction(title: "Cencel",
                                            style: .default,
                                            handler: nil))
    present(alertController, animated: true)
  }
  

}
