//
//  MusicController.swift
//  AppStore
//
//  Created by 金亮齐 on 2022/2/19.
//

import UIKit

class MusicController: BaseListController,UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    fileprivate let footerId = "footerId"

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(TrackCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(MusicLoadingFooter.self,forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
        fetchData()
    }
    
    
    var results = [FeedResult]()
    
    fileprivate func fetchData() {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/cn/music/most-played/10/albums.json"
        Service.shared.fetchGenericJSONData(urlString: urlString) { (searchResult: AppGroup? ,err) in
            if let err = err {
                print("",err)
                return
            }
            
            self.results = searchResult?.feed.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }

    
    var isPaginating = false
    var isDonePaginating = false
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TrackCell
        let track = results[indexPath.item]
        cell.nameLabel.text = track.artistName
        cell.subtitleLabel.text = track.name
        cell.imageView.kf.setImage(with: URL(string: track.artworkUrl100))
        
        if indexPath.item == results.count - 1 && !isPaginating {
            let urlString = "https://rss.applemarketingtools.com/api/v2/cn/music/most-played/\(results.count)/albums.json"
            print(urlString)
            Service.shared.fetchGenericJSONData(urlString: urlString) { (searchResult: AppGroup? ,err) in
                if let err = err {
                    print("",err)
                    return
                }
                
                if searchResult?.feed.results.count == 0 {
                    self.isDonePaginating = true
                }
                
                sleep(2)
                self.results += searchResult?.feed.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                self.isPaginating = false
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = isDonePaginating ? 0 : 100
        return .init(width: view.frame.width, height: 100)
    }
}
