//
//  EntryAddPresenterInput.swift
//  BnetTest
//
//  Created by Антон on 20.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol EntryAddPresenterInput: class {
    func attach(_ viewController: EntryAddPresenterOutput)
    func cancleButtonTap()
    func saveButtonTap(text: String)
}
