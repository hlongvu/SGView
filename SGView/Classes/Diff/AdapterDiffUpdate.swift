//
//  AdapterDiffUpdate.swift
//  SGView
//
//  Created by Long Vu on 1/17/19.
//  Copyright © 2019 Long Vu. All rights reserved.
//

import Foundation
import UIKit

extension UITableView{
    func applyDiff<T: Collection>(_ old: T, _ new: T, inSection section: Int, withAnimation animation: UITableView.RowAnimation, reloadUpdated: Bool = true) where T.Iterator.Element: Hashable, T.Index == Int {
        let update = ListUpdate(diff(old, new), section)
        //print(update)
        beginUpdates()
        
        deleteRows(at: update.deletions, with: animation)
        insertRows(at: update.insertions, with: animation)
        for move in update.moves {
            moveRow(at: move.from, to: move.to)
        }
        endUpdates()
        
        // reloadItems is done separately as the update indexes returne by diff() are in respect to the
        // "after" state, but the collectionView.reloadItems() call wants the "before" indexPaths.
        if reloadUpdated && update.updates.count > 0 {
            beginUpdates()
            reloadRows(at: update.updates, with: animation)
            endUpdates()
        }
    }
}

extension SGAdapter{
    public func buildModelsAndDiff(animation: UITableView.RowAnimation){
        let currentModels = self.getModelList()
        let newModels = self.buildModels()
        self.setModelList(newModels)
        
        self.getTableView()?.applyDiff(currentModels!, newModels, inSection: 0, withAnimation: animation, reloadUpdated: true)
    }
}
