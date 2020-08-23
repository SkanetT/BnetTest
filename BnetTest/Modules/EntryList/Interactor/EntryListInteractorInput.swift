//
//  EntryListInteractorInput.swift
//  BnetTest
//
//  Created by Антон on 19.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol EntryListInteractorInput: class {
    func attach(_ output: EntryListInteractorOutput)
    func fetchEntryData()
}
