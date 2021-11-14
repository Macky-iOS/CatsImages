

import UIKit
import SDWebImage

class ImageTVC: UITableViewCell {

    //MARK: - Outlet
    @IBOutlet weak var imgCats: UIImageView!
    
    //MARK: - Helper Functions
    func configure(data: ImageConfigurations){
        imgCats.loadWithIndicator(fromUrlString: data.url)
    }
    
}


//MARK: - Image View Indicator showing

extension UIImageView {
    
  
    func loadWithIndicator(fromUrlString string: String) {
        sd_imageIndicator?.indicatorView.backgroundColor = .blue
        sd_imageIndicator?.indicatorView.tintColor = .blue
        sd_imageIndicator?.startAnimatingIndicator()
        sd_setImage(with: URL(string: string), completed: {_,_,_,_ in
            self.sd_imageIndicator?.stopAnimatingIndicator()
        })
    }
}
