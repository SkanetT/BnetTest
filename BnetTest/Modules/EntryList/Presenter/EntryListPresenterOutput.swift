//
//  EntryListPresenterOutput.swift
//  BnetTest
//
//  Created by Антон on 19.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol EntryListPresenterOutput: class {
    func dataDidReceive(_ data: [EntryData] )
    func setActionForCell(_ userSelect: ((String) -> ())?)
}
