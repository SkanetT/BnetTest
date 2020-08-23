//
//  Enums.swift
//  BnetTest
//
//  Created by Антон on 22.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

enum HttpMethods: String {
    case get = "GET"
    case post = "POST"
}

enum ApiErrors: Error {
    case noInternet
    case noData
    case unknown
}
