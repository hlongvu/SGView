//
//  ColorCell.swift
//  SGView
//
//  Created by Long Vu on 1/18/19.
//  Copyright © 2019 Long Vu. All rights reserved.
//

import Foundation
import UIKit
import SGView

class ColorCell: UITableViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

class ColorCellModel: SGModel{
    var color: UIColor!
    
    init(_ id: String, _ color: UIColor) {
        super.init(id)
        self.color = color
    }
    
    override func nibName() -> String {
        return ColorCell.typeName
    }
    
    override func fillData(cell: UITableViewCell) {
        super.fillData(cell: cell)
        cell.selectionStyle = .none
        if let c = cell as? ColorCell{
            c.backgroundColor = self.color
        }
    }
}
