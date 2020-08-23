//
//  EntryListRouting.swift
//  BnetTest
//
//  Created by Антон on 20.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol EntryListRouting {
    func presentEntryAdd()
    func presentEntryViewing(_ body: String)
    func showError(_ error: ApiErrors)
    func noNet(refresh: (() -> ())?)
}
