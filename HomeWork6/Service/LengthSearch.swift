//
//  LengthSearch.swift
//  HomeWork6
//
//  Created by Vitaliy Voronok on 14.05.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

struct LengthSearch {
    let metersRegex = #"[0-9]+(\.|\,)?[0-9]*\s(metres|метров|метр|м|metre|m)"#
    let kilometrsRegex = #"[0-9]+(\.|\,)?[0-9]*\s*(kilometres|kilometre|километров|километр|км|km)"#
    let milRegex = #"[0-9]+(\.|\,)?[0-9]*\s*(miles|mile|mi)"#
    let footRegex = #"[0-9]+(\.|\,)?[0-9]*\s*(feets|feet|foot|ft)"#
    let yardRegex = #"[0-9]+(\.|\,)?[0-9]*\s*(yards|yard)"#
    let inchRegex = #"[0-9]+(\.|\,)?[0-9]*\s*(inches|inch|in)"#
    let centimetersRegex = #"[0-9]+(\.|\,)?[0-9]*\s*(centimetres|centimetre|cm|сантиметров|сантиметр|см)"#
    
    let searcher: Searcher = Searcher()
    
    func search(text: String) -> [String: Measurement<UnitLength>] {
        var result: [String: Measurement<UnitLength>] = [:]
        result.merge(search(text: text, pattern:metersRegex,  unit: UnitLength.meters)) { (current, _) in current }
        result.merge(search(text: text, pattern:kilometrsRegex,  unit: UnitLength.kilometers)) { (current, _) in current }
        result.merge(search(text: text, pattern:milRegex,  unit: UnitLength.miles)) { (current, _) in current }
        result.merge(search(text: text, pattern:footRegex,  unit: UnitLength.feet)) { (current, _) in current }
        result.merge(search(text: text, pattern:yardRegex,  unit: UnitLength.yards)) { (current, _) in current }
        result.merge(search(text: text, pattern:inchRegex,  unit: UnitLength.inches)) { (current, _) in current }
        result.merge(search(text: text, pattern:centimetersRegex,  unit: UnitLength.centimeters)) { (current, _) in current }
        return result
    }

    private func search(text: String, pattern: String, unit: UnitLength) -> [String: Measurement<UnitLength>] {
        let stringMeters: [String] = searcher.search(text: text, pattern: pattern)
        var result: [String: Measurement<UnitLength>] = [:]
        
        for meterString in stringMeters {
            if let unitValue = extractLength(meterString) {
                result[meterString] = Measurement(value: unitValue, unit: unit)
            } else {
                print("Invalid value \(meterString)")
            }
        }
        
        return result
    }
    
    private func extractLength(_ text: String) -> Double? {
        var digit = text.trimmingCharacters(in: CharacterSet(charactersIn: "01234567890.,").inverted)
        digit = digit.replacingOccurrences(of: ",", with: ".")
        
        return Double(digit)
    }
}
