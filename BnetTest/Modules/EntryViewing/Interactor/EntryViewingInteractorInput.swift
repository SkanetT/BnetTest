//
//  EntryViewingInteractorInput.swift
//  BnetTest
//
//  Created by Антон on 22.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol EntryViewingInteractorInput: class  {
    func attach(_ output: EntryViewingInteractorOutput)
    func fetchStringForBody()
}
