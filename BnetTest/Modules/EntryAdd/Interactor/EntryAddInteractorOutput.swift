//
//  EntryAddInteractorOutput.swift
//  BnetTest
//
//  Created by Антон on 20.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol EntryAddInteractorOutput: class {
    func successSave()
    func failuresave(_ error: ApiErrors)
}
