//
//  ViewController.swift
//  NetWorking
//
//  Created by 金亮齐 on 2022/4/2.
//

import UIKit
import Alamofire
import KakaJSON


class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        AF.request(API.imgrank, parameters: ["page":1,"count": 20]).responseJSON { response in
            print(response.result)
        }
        // Do any additional setup after loading the view.
    }


}

