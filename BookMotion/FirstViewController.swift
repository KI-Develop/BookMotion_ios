
import UIKit
import MBCircularProgressBar

class FirstViewController: UIViewController {
  @IBOutlet weak var plantHP: MBCircularProgressBarView!
  @IBOutlet weak var plantBtn: UIButton!
  @IBOutlet weak var treeImg: UIImageView!
  @IBOutlet weak var jyouro: UIButton!
  @IBOutlet weak var treePointLabel: UILabel!
  
  
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
  
  
  let animationDuration: TimeInterval = 2.0
  
  
  var imageIndex = 0
  var treePoint = 0
  var userDafaults = UserDefaults.standard
  var alertController: UIAlertController!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    treeImg.image = images[0]
    plantHP.value = 0
    plantHP.maxValue = 100
    
    plantBtn.backgroundColor = UIColor(displayP3Red: 50/255, green: 230/255, blue: 100/255, alpha: 0.8)
    plantBtn.layer.cornerRadius = 10
    plantBtn.layer.masksToBounds = true
    
    jyouro.backgroundColor = UIColor(displayP3Red: 0/255, green: 255/255, blue: 255/255, alpha: 0.8)
    jyouro.layer.cornerRadius = 10
    jyouro.layer.masksToBounds = true
    
    treePoint = 1000
    userDafaults.register(defaults: ["treePoint": treePoint])

  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    treePoint = userDafaults.integer(forKey: "treePoint")
    treePointLabel.text = String(treePoint)
  }

  @IBAction func plant(_ sender: Any) {
    UIView.animate(withDuration: 1.0) {
      self.plantHP.value += 20.0
      self.treePoint -= 20
      self.treePointLabel.text = String(self.treePoint)
      self.userDafaults.set(self.treePoint, forKey: "treePoint")
    }
    if(self.plantHP.value == 100){
      
      self.performSegue(withIdentifier: "treeModalSegue", sender: self.imageIndex)
      self.imageIndex += 1
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
        self.treeImg.image = self.images[self.imageIndex]
        self.plantHP.value = 0
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 7.01) {
        print(2)
        self.performSegue(withIdentifier: "messageModalSegue", sender: nil)
      }
    }
  }
  
  @IBAction func waterBtn(_ sender: Any) {
    self.performSegue(withIdentifier: "waterModalSegue", sender: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "treeModalSegue" {
      let treeModal = segue.destination as! TreeModalViewController
      treeModal.imageIndex = sender as! Int
    }
  }
}

