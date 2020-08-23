//
//  Dictionary.swift
//  BnetTest
//
//  Created by Антон on 22.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == String {
    func makeDataForRequest() -> Data? {
        let result = self.map { key, value -> String in
            return "\(key)=\(value)"
        }.joined(separator: "&")
        return result.data(using: .utf8)
    }
}
