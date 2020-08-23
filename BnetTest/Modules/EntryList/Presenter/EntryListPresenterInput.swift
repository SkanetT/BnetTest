//
//  EntryListPresenterInput.swift
//  BnetTest
//
//  Created by Антон on 19.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol EntryListPresenterInput: class {
    func attach(_ viewController: EntryListPresenterOutput)
    func viewDidLoad()
    func viewWillAppear()
    func addEntryTap()
}
