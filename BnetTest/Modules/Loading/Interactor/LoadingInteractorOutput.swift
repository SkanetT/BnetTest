//
//  LoadingInteractorOutput.swift
//  BnetTest
//
//  Created by Антон on 23.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LoadingInteractorOutput: class {
    func success()
    func failure(_ error: ApiErrors)
}
