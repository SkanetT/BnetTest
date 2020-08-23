//
//  EntryData.swift
//  BnetTest
//
//  Created by Антон on 22.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

struct ListData: Codable {
    let status: Int
    let data: [[EntryData]]
}

struct EntryData: Codable {
    let id, body, da, dm: String
}
