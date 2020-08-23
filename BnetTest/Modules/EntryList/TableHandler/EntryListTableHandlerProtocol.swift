//
//  EntryListTableHandlerProtocol.swift
//  BnetTest
//
//  Created by Антон on 21.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

protocol EntryListTableHandlerProtocol {
    func attach(_ tableView: UITableView)
    func setData(_ data: [EntryData])
    func setAction(userSelect: ((String) -> ())?)
}
