//
//  Formatter.swift
//  HomeWork6
//
//  Created by Vitaliy Voronok on 14.05.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

struct Formatter {
    let locale: Locale
    
    func format(_ text: String) -> String {
        var result = formatDates(text: text)
        result = formatLength(text: result)
        
        return result
    }
    
    private func formatDates(text: String) -> String {
        var result = text
        let dates = DatesSearch().search(text: text)
        
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dMMMMyEEEE")
        dateFormatter.locale = locale
        
        for (key, value) in dates {
            result = result.replacingOccurrences(of: key, with: dateFormatter.string(from: value))
        }
        
        return result
    }
    
    private func formatLength(text: String) -> String {
        var result = text
        let Lengths = LengthSearch().search(text: text)
        
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.locale = locale
        
        for (key, value) in Lengths {
            result = result.replacingOccurrences(of: key, with: "\(measurementFormatter.string(from: value))")
        }
        
        return result
    }
}
