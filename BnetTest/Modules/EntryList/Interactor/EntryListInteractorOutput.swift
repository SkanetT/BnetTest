//
//  EntryListInteractorOutput.swift
//  BnetTest
//
//  Created by Антон on 19.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol EntryListInteractorOutput: class {
    func entryDataSuccess(_ data: [EntryData] )
    func entryDataFailure(_ error: ApiErrors)
}
