//
//  Model.swift
//  TestEpox
//
//  Created by Long Vu on 5/11/17.
//  Copyright © 2017 SUN. All rights reserved.
//

import Foundation
import UIKit

open class SGModel: Hashable{
    var myid: String!
    public init(_ id: String) {
        self.id = id
    }
    
    public static func == (lhs: SGModel, rhs: SGModel) -> Bool {
        return lhs.getId() == rhs.getId()
    }

    open var hashValue: Int {
        return getId().hashValue
    }
    
    public var id:String {
        get{
            return self.myid
        }
        set{
            self.myid = newValue
        }
    }
    
    open  func getId()-> String { return self.id}
    open func getHeight()-> CGFloat { return UITableView.automaticDimension}
//    open  func getHeight()-> CGFloat { return 0}
    open func nibName()-> String {return ""}
    open func fillData(cell: UITableViewCell) {}
    open func didSelect(index:Int){}
    open func didDelete(index:Int){}
    open func didEdit(index:Int){}
    open func didMoveRow(fromIndex: Int, toIndex: Int) {}
    open func canEditRow() -> Bool {return false}
    open func canDeleteRow() -> Bool {return false}
    open func canMoveRow() -> Bool {return false}
}


class SGModelWithView: SGModel{
    var contentView: UIView?
}
