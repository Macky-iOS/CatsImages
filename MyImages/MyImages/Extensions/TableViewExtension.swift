
import UIKit

protocol Registerable {
    static var identifier: String { get }
    static func cellFor<T: Registerable>(_ parent: UIDataSourceTranslating, _ indexPath: IndexPath) -> T
    static func dequeReusably(for parent: UIDataSourceTranslating, at indexPath: IndexPath) -> Self
}

extension Registerable {
    static var identifier: String { return "\(self)" }
    
    internal static func cellFor<T: Registerable>(_ parent: UIDataSourceTranslating, _ indexPath: IndexPath) -> T {
        if let table = parent as? UITableView {
            return table.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
        } else {
            return (parent as! UICollectionView).dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
        }
    }
    
    static func dequeReusably(for parent: UIDataSourceTranslating, at indexPath: IndexPath) -> Self {
        return cellFor(parent, indexPath)
    }
}

extension UITableViewCell: Registerable { }

extension UIDataSourceTranslating {
    /**
     Register cells from XIB to your collection or table views
     - parameter cells: Class names of required TableView or Collectionview cells you need to register to your table or collectionview
     */
    func register(cells: Registerable.Type...) {
        if let tableViewCells = cells as? [UITableViewCell.Type] {
            tableViewCells.forEach {
                (self as? UITableView)?.register(UINib(nibName: $0.identifier, bundle: nil),
                                                 forCellReuseIdentifier: $0.identifier)
            }
        }
    }
    
}
