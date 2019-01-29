//
//  ImageCell.swift
//  SGView
//
//  Created by Long Vu on 1/17/19.
//  Copyright © 2019 Long Vu. All rights reserved.
//

import Foundation
import UIKit
import SGView
class ImageCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
}

class ImageCellModel: SGModel{
    var text: String?
    var imgName: String!
    
    init(_ id: String, _ text: String, img: String) {
        super.init(id)
        self.text = text
        self.imgName = img
    }
    
    override func getHeight() -> CGFloat {
        return 220
    }
        
    override func nibName() -> String {
        return ImageCell.typeName
    }
    
    override func fillData(cell: UITableViewCell) {
        super.fillData(cell: cell)
        cell.selectionStyle = .none
        if let c = cell as? ImageCell{
            c.title.text = self.text
            c.img.image = UIImage(named: self.imgName)
        }
    }
}
