//
//  LoadingRouting.swift
//  BnetTest
//
//  Created by Антон on 23.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

protocol LoadingRouting {
    func presentList()
    func showError(_ error: ApiErrors)
    func setError(error: (() -> ())?)
}
