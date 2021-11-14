

import UIKit

final class ImageZoomedVC: UIViewController {

    // MARK: -  Outlets and Variables
    @IBOutlet weak var img: UIImageView!
    var url = String()
    
    //MARK: - Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        img.loadWithIndicator(fromUrlString: url)
    }
    
    //MARK: - Button Actions
    @IBAction func btnDismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
   

}
