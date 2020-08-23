//
//  EntryViewingInteractor.swift
//  BnetTest
//
//  Created by Антон on 22.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class EntryViewingInteractor: EntryViewingInteractorInput {
    
    weak var output: EntryViewingInteractorOutput?
    
    let body: String
    
    init(_ body: String) {
        self.body = body
    }
    
    func attach(_ output: EntryViewingInteractorOutput) {
        self.output = output
    }
    
    func fetchStringForBody() {
        output?.bodyDidReceive(body)
    }
}
