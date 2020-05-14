//
//  Searcher.swift
//  HomeWork6
//
//  Created by Vitaliy Voronok on 14.05.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

struct Searcher {
    func search(text: String, pattern: String) -> [String] {
        var values: [String] = []
        
        do {
            let items = try NSRegularExpression(pattern: pattern)
            let results = items.matches(in: text, range: NSRange(text.startIndex..., in: text))
            values = results.compactMap {
                Range($0.range, in: text).map { String(text[$0]) }
            }
            
        }  catch let error {
            print("search error \(error)")
        }
        
        return values
    }
}
