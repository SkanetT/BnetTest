//
//  EntryListTableHandler.swift
//  BnetTest
//
//  Created by Антон on 21.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class EntryListTableHandler: NSObject, EntryListTableHandlerProtocol {
    
    private weak var tableView: UITableView?
    
    var data: [EntryData] = []
    var userSelectCell: ((String) -> ())?
    
    func attach(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "EntyListCell", bundle: nil), forCellReuseIdentifier: "EntyListCell")
    }
    
    func setData(_ data: [EntryData]) {
        DispatchQueue.main.async {
            self.data = data
            self.tableView?.reloadData()
        }
    }
    
    func setAction(userSelect: ((String) -> ())?) {
        self.userSelectCell = userSelect
    }
}

extension EntryListTableHandler: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntyListCell", for: indexPath) as! EntyListCell
        cell.selectionStyle = .none
        cell.setData(data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userSelectCell?(data[indexPath.row].body)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}



