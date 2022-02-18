//
//  AppsHeaderHorizontalController.swift
//  AppStore
//
//  Created by qijinliang on 2022/2/18.
//
import UIKit

class AppsHeaderHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    var rankinglists = [Headlist]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        fetchTest()

    }
    
    
    
    //MARK -- 测试网络数据并返回结果
    fileprivate func fetchTest() {

        guard let url = URL(string: "http://app.u17.com/v3/appV3_3/ios/phone/rank/list") else {
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let jsonDecode = try JSONDecoder().decode(HeadModel.self, from: data)
                    let returnDataJson = jsonDecode.data.returnData
                    DispatchQueue.main.async {
                        self.rankinglists = returnDataJson.rankinglist
                    }
                    return
                } catch let jsonError as NSError {
                    print("jsonError faild",jsonError.localizedDescription)
                    return
                }
            }
            print("Fialid:\(String(describing: error?.localizedDescription))")
        }.resume()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rankinglists.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsHeaderCell
        let app = self.rankinglists[indexPath.item]
        cell.companyLabel.text = app.title
        cell.titleLabel.text = app.subTitle
        cell.imageView.kf.setImage(with: URL(string: app.cover))
        return cell
    }
    
}
