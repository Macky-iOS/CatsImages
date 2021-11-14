

import UIKit

final class ImageZoomedVC: UIViewController {

    @IBOutlet weak var img: UIImageView!
    var url = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.loadWithIndicator(fromUrlString: url)
    }
    
    @IBAction func btnDismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
   

}
