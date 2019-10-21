
import UIKit
import MBCircularProgressBar

class FirstViewController: UIViewController {
  @IBOutlet weak var plantHP: MBCircularProgressBarView!
  @IBOutlet weak var plantBtn: UIButton!
  @IBOutlet weak var treeImg: UIImageView!
  
  
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
  var alertController: UIAlertController!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    animateImageView()
    
    treeImg.image = images[0]
    plantHP.value = 0
    plantHP.maxValue = 100
    plantBtn.backgroundColor = UIColor(displayP3Red: 50/255, green: 230/255, blue: 100/255, alpha: 0.8)
    plantBtn.layer.cornerRadius = 10
    plantBtn.layer.masksToBounds = true

  }

  @IBAction func plant(_ sender: Any) {
    UIView.animate(withDuration: 1.0) {
      self.plantHP.value += 20.0
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
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "treeModalSegue" {
      let treeModal = segue.destination as! TreeModalViewController
      treeModal.imageIndex = sender as! Int
    }
  }
}

