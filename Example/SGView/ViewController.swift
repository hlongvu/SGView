//
//  ViewController.swift
//  SGView
//
//  Created by Long Vu on 1/17/19.
//  Copyright © 2019 Long Vu. All rights reserved.
//

import UIKit
import SGView

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var adapter: MainAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        adapter = MainAdapter()
        adapter?.loadView = 0
        adapter?.setUp(self.tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.buttonClick(notification:)), name: Notification.Name(ButtonCell.BUTTON_CLICK), object: nil)
    }
    
    @objc func buttonClick(notification: Notification) {
        // Take Action on Notification
        if let button_id = notification.userInfo?["button_id"] as? String{
            print("Click \(button_id)")
            if adapter?.loadView == 0{
                adapter?.loadView = 1
            } else if adapter?.loadView == 1{
                adapter?.loadView = 2
            }else{
                adapter?.loadView = 0
            }
            if button_id == "button1"{
                adapter?.reBuildModelsAndReloadTable()
            }else{
                adapter?.buildModelsAndDiff(animation: .fade)
            }
    
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

}

