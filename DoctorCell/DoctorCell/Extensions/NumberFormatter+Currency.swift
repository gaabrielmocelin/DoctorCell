//
//  NumberFormatter+Currency.swift
//  DoctorCell
//
//  Created by Gabriel Mocelin on 09/12/18.
//  Copyright © 2018 Gabriel Mocelin. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static var currency: NumberFormatter {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        return currencyFormatter
    }
    
    func string(from value: Float) -> String? {
        return self.string(from: NSNumber(value: value))
    }
}
