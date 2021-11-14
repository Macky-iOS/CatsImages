

import UIKit

 final class DisclaimerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        proceed()
    }
    
    
     private func proceed(){
         DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
             let vc = ImageListVC.instantiateFrom(storyboard: .main)
             self.navigationController?.pushViewController(vc, animated: true)
         })
     }

   

}
