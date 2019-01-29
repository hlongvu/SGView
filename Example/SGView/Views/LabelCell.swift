//
//  LabelCell.swift
//  SGView
//
//  Created by Long Vu on 1/17/19.
//  Copyright © 2019 Long Vu. All rights reserved.
//

import Foundation
import UIKit
import SGView

class LabelCell: UITableViewCell {
    let label = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.label)
        self.label.backgroundColor = .clear
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        self.label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        self.label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        self.label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        self.label.numberOfLines = 0
        self.label.heightAnchor.constraint(greaterThanOrEqualToConstant: 44).isActive = true
    }
}

class LabelCellModel: SGModel{
    var text: String?
    
    init(_ id: String, _ text: String) {
        super.init(id)
        self.text = text
    }
    
    override func nibName() -> String {
        return LabelCell.typeName
    }
    
    override func fillData(cell: UITableViewCell) {
        super.fillData(cell: cell)
        cell.selectionStyle = .none
        if let c = cell as? LabelCell{
            c.label.text = self.text
        }
    }
}
