//
//  LoadingInteractorInput.swift
//  BnetTest
//
//  Created by Антон on 23.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LoadingInteractorInput: class {
    func attach(_ output: LoadingInteractorOutput)
    func isFirstRunning()
}
