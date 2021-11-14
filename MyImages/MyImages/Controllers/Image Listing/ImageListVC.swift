

import UIKit

final class ImageListVC: UIViewController {

    // MARK: - Outlets and Variables
    @IBOutlet weak var tblViewImages: UITableView!
    var arrImageList = [ImageConfigurations]()
    var pageNumber = 0
    
    // MARK: - Controller Life Cycle and Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewImages.register(cells: ImageTVC.self)
        getResult()
    }
    
}

// MARK: - Table View Delegate and Datasource
extension ImageListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ImageTVC.dequeReusably(for: tableView, at: indexPath)
        cell.configure(data: arrImageList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ImageZoomedVC.instantiateFrom(storyboard: .main)
        vc.url = arrImageList[indexPath.row].url
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       let lastItem = arrImageList.count - 1
        if indexPath.row == lastItem  && arrImageList.count < 38{
           getResult()
       }
   }
}

// MARK: - Api Calls
extension ImageListVC{
    private func getResult(){
        hitCatsApi()
    }
}
