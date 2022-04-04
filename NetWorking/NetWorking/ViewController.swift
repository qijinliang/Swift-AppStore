//
//  ViewController.swift
//  NetWorking
//
//  Created by 金亮齐 on 2022/4/2.
//

import UIKit
import Alamofire
import SwiftyJSON
import KakaJSON


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    lazy var tableView = UITableView()
    lazy var items = [Item]()
    static let ItemCellID = "item"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.ItemCellID)
        view.addSubview(tableView)
        
        
        AF.request(API.imgrank, parameters: ["page":1]).responseJSON { response in
            
            guard let dict = response.value else { return }
            let jsonsArray = JSON(dict)["items"].arrayObject
            
            let modelsArray = modelArray(from: jsonsArray!, Item.self)
            print(modelsArray)
            self.items.append(contentsOf: modelsArray)
    
            self.tableView.reloadData()
            
        }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.ItemCellID, for: indexPath)
        
        let item = items[indexPath.row]
    
        cell.textLabel?.text = item.content
        return cell
    }
}

