//
//  TestViewController.swift
//  AppStore
//
//  Created by 金亮齐 on 2022/4/5.
//

import UIKit
import Alamofire
import SwiftyJSON
import KakaJSON
import MJRefresh


class TestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    lazy var tableView = UITableView()
    lazy var items = [Item]()
    static let ItemCellID = "item"
    var page = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.ItemCellID)
        view.addSubview(tableView)
        
        let header = MJRefreshNormalHeader(refreshingBlock: self.loadNewData)
//        header.beginRefreshing()
        tableView.mj_header = header
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: self.loadMoreData)

    }
    
    func loadNewData() {
        AF.request(API.imgrank, parameters: ["page":1]).responseJSON { response in
            
            guard let dict = response.value else { return }
            let jsonsArray = JSON(dict)["items"].arrayObject
            
            let modelsArray = modelArray(from: jsonsArray!, Item.self)
            print(modelsArray)
            self.items.removeAll()
            self.items.append(contentsOf: modelsArray)
    
            self.tableView.reloadData()
            self.tableView.mj_header?.endRefreshing()
            self.page = 1
        }
    }
    
    func loadMoreData() {
        AF.request(API.imgrank, parameters: ["page":page + 1]).responseJSON { response in
            
            guard let dict = response.value else { return }
            let jsonsArray = JSON(dict)["items"].arrayObject
            
            let modelsArray = modelArray(from: jsonsArray!, Item.self)
            print(modelsArray)

            self.items.append(contentsOf: modelsArray)
    
            self.tableView.reloadData()
            self.tableView.mj_footer?.endRefreshing()
            self.page += 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.mj_footer?.isHidden = items.count == 0
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: Self.ItemCellID, for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.content

        return cell
    }
}

