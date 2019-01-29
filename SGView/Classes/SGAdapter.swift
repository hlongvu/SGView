//
//  Adapter.swift
//  TestEpox
//
//  Created by Long Vu on 5/11/17.
//  Copyright © 2017 SUN. All rights reserved.
//

import Foundation
import UIKit

open class SGAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    private var modelList: [SGModel]?
    private var tableView: UITableView?
    public override init() {
        modelList = []
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let m = modelList![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: m.nibName(), for: indexPath)
        m.fillData(cell: cell)
        return cell
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelList?.count ?? 0
    }
    

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return modelList?[indexPath.row].getHeight() ?? 0
    }
    
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return modelList![indexPath.row].canEditRow() ||  modelList![indexPath.row].canDeleteRow()
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
//            print("Delete")
            modelList![indexPath.row].didDelete(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //print("triggered!")
        var action:[UITableViewRowAction] = []
        let canEdit = modelList![indexPath.row].canEditRow()
        if (canEdit){
            let edit = UITableViewRowAction(style: .default, title: "Edit") { action, index in
               // print("edit button tapped")
                self.modelList![indexPath.row].didEdit(index: index.row)
            }
            edit.backgroundColor = UIColor.yellow
            action.append(edit)
        }
        
        let canDelete = modelList![indexPath.row].canDeleteRow()
        if (canDelete){
            let delete = UITableViewRowAction(style: .default, title: "Delete") { action, index in
//                print("delete button tapped")
                self.modelList![indexPath.row].didDelete(index: index.row)
            }
            delete.backgroundColor = UIColor.red
            action.append(delete)
        }
        return action
    }
    
     public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return modelList![indexPath.row].canMoveRow()
    }
    
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if modelList![sourceIndexPath.row].canMoveRow() {
            self.modelList![sourceIndexPath.row].didMoveRow(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
        }
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let modelList = modelList, indexPath.row < modelList.count else {
            return
        }
        modelList[indexPath.row].didSelect(index: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }    
    
    open func buildModels()-> [SGModel]{
        return []
    }
    
    func clearModels(){
        modelList?.removeAll()
    }
    
    func addModel(_ model:SGModel){
        modelList?.append(model)
    }
    
    open func setUp(_ tv:UITableView){
        self.tableView = tv
        registerNib(tableView: tableView!)
        self.modelList = buildModels()
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }
    
    public func reBuildModelsAndReloadTable(){
        self.modelList = buildModels()
        self.tableView?.reloadData()
    }
    
    public func reBuildModelsAndReloadTableAnimate(){
        self.modelList = buildModels()
        self.tableView?.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    public func getModelList() -> [SGModel]?{
        return modelList
    }
    
    public func setModelList(_ list: [SGModel]){
        self.modelList = list
    }
    
    public func getTableView() -> UITableView?{
        return self.tableView
    }
    
    open func registerNib(tableView:UITableView){
        
    }
    
    public func reloadCellAtModel<T>(type: T.Type){
        if self.modelList == nil {
            return
        }
        for (index, model) in self.modelList!.enumerated(){
            if model is T{
//                print("reload", index)
                self.tableView?.reloadRows(at: [IndexPath(row:index, section:0)], with: .none)
                return
            }
        }
    }
    
    public func reloadCellAtIndex(index: Int){
        self.modelList = buildModels()
        self.tableView?.reloadRows(at: [IndexPath(row:index, section:0)], with: .none)
    }
}

extension UITableView{
    public  func registerCellNib(_ name:String){
        let cellNib = UINib.init(nibName: name, bundle: nil)
        self.register(cellNib, forCellReuseIdentifier: name)
    }
    
    public func registerCellClass(_ c: AnyClass){
        self.register(c, forCellReuseIdentifier: String(describing: c))
    }
}
