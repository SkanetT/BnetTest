//
//  Int.swift
//  BnetTest
//
//  Created by Антон on 22.08.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

extension Int {
    
    func makeDate() -> String {
        let date = Date(timeIntervalSince1970: Double(self))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+3")
        dateFormatter.locale = NSLocale.init(localeIdentifier: "RU_ru") as Locale
        dateFormatter.dateFormat = "d MMMM yyyy HH:mm"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}
