//
//  EntryAddInteractorInput.swift
//  BnetTest
//
//  Created by Антон on 20.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol EntryAddInteractorInput: class {
    func attach(_ output: EntryAddInteractorOutput)
    func tryToSave(_ text: String)
}
