//
//  ButtonCell.swift
//  SGView
//
//  Created by Long Vu on 1/17/19.
//  Copyright © 2019 Long Vu. All rights reserved.
//

import Foundation
import UIKit
import SGView
class ButtonCell: UITableViewCell {
    static let BUTTON_CLICK = "BUTTON_CLICK"
    var clickFunc : (()-> Void)?
    @IBOutlet weak var btn: UIButton!
    @IBAction func btnClick(_ sender: Any) {
        self.clickFunc?()
    }
}

class ButtonCellModel: SGModel {
    var text: String!
    
    init(_ id: String, _ text: String) {
        super.init(id)
        self.text = text
    }
    
    override func getHeight() -> CGFloat {
        return 80
    }
    
    override func nibName() -> String {
        return ButtonCell.typeName
    }
    
    override func fillData(cell: UITableViewCell) {
        super.fillData(cell: cell)
        cell.selectionStyle = .none
        if let c = cell as? ButtonCell{
            c.btn.setTitle(self.text, for: .normal)
            c.clickFunc = {
                 NotificationCenter.default.post(name: Notification.Name(ButtonCell.BUTTON_CLICK), object: nil, userInfo: ["button_id": self.id])
            }
        }
    }
    
}
