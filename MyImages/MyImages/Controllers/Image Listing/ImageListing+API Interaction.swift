

import UIKit
import Alamofire

extension ImageListVC{
    func hitCatsApi(){
        let request = AF.request("https://api.thecatapi.com/v1/images/search?limit=9&page=\(pageNumber)&order=Desc", method: .get, parameters: nil, headers: nil)
        request.responseJSON(completionHandler: { response in
            switch response.result{
            case .success(let anyValue):
                guard let arrDict = anyValue as? [[String: Any]] else{return}
                for each in arrDict{
                    let data = ImageConfigurations(data: each)
                    self.arrImageList.append(data)
                }
                if self.arrImageList.count > 38{
                    self.arrImageList.removeLast(self.arrImageList.count - 38)
                }
                self.pageNumber += 1
                self.tblViewImages.reloadData()
            default: break
            }
        })
    }
}

class ImageConfigurations{
    var height = Int()
    var width = Int()
    var url = String()
    var id = String()
    
    init(data: [String: Any]) {
        id = data["id"] as? String ?? ""
        url = data["url"] as? String ?? ""
        width = data["width"] as? Int ?? 0
        height = data["height"] as? Int ?? 0
    }
}
