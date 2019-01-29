//
//  TypeName.swift
//  sShip
//
//  Created by Long Vu on 4/25/17.
//  Copyright © 2017 sGlobal. All rights reserved.
//

import Foundation
import UIKit

protocol TypeName: AnyObject {
    static var typeName: String { get }
}

// Swift Objects
extension TypeName {
    public static var typeName: String {
        let type = String(describing: self)
        return type
    }
}

// Bridge to Obj-C
extension NSObject: TypeName {
    public  class var typeName: String {
        let type = String(describing: self)
        return type
    }
}
