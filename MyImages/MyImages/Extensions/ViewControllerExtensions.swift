
import UIKit

enum Storyboard : String {
    case main, launch
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self == .launch ? "LaunchScreen" : rawValue.capitalized, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(_ controller: T.Type) -> T {
        let storyId = (controller as UIViewController.Type).identifier
        return instance.instantiateViewController(withIdentifier: storyId) as! T
    }
}

extension UIViewController {
    class var identifier: String {
        return "\(self)"
    }
    
    
    static func instantiateFrom(storyboard: Storyboard) -> Self {
        return storyboard.viewController(self)
    }
}

