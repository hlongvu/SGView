//
//  MainAdapter.swift
//  SGView
//
//  Created by Long Vu on 1/17/19.
//  Copyright © 2019 Long Vu. All rights reserved.
//

import Foundation
import UIKit
import SGView

class MainAdapter: SGAdapter {
    var loadView: Int = 0
    override func registerNib(tableView: UITableView) {
        tableView.registerCellNib(ImageCell.typeName)
        tableView.registerCellNib(ButtonCell.typeName)
        tableView.registerCellClass(LabelCell.self)
        tableView.registerCellClass(ColorCell.self)
    }
    
    override func buildModels() -> [SGModel] {
        var list = [SGModel]()
       
        if loadView == 0{
            list.append(ColorCellModel("color1", .black))
            list.append(ColorCellModel("color2", .blue))
            list.append(ColorCellModel("color3", .yellow))
            list.append(ColorCellModel("color4", .brown))
            list.append(ColorCellModel("color5", .green))
        }else if loadView == 1{
            for i in 10...20{
                list.append(ColorCellModel("color15\(i)", UIColor.random()) )
            }
        }else{
            list.append(LabelCellModel("label1","Hello world"))
            list.append(LabelCellModel("label2","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."))
            
            list.append(ImageCellModel("image1", "Hello", img: "feel.jpg"))
            
            list.append(LabelCellModel("label3","Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."))
            
            list.append(ImageCellModel("image2", "Let me think", img: "pepe.jpg"))
            
            for i in 10...20{
                list.append(LabelCellModel("text_loop1\(i)", "Hello new \(i)"))
            }
        }
        list.append(ButtonCellModel("button1", "Click me to change Instantly"))
        list.append(ButtonCellModel("button2", "Click me to change Animated"))
        return list
    }
}


extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
