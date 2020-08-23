//
//  EntryAddRouting.swift
//  BnetTest
//
//  Created by Антон on 20.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol EntryAddRouting {
    func dismiss()
    func showZeroAlert()
    func showError(_ error: ApiErrors)
    func noText(empty: (() -> ())?)
}
