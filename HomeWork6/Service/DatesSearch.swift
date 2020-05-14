//
//  DatesSearch.swift
//  HomeWork6
//
//  Created by Vitaliy Voronok on 14.05.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

struct DatesSearch {
    let dateRegex = #"\d{1,2}\/\d{1,2}\/\d{4}"#

    let dateForamt = "dd/MM/yyyy"
    
    let searcher: Searcher = Searcher()
    
    func search(text: String) -> [String: Date] {
        let stringDates: [String] = searcher.search(text: text, pattern: dateRegex)
        var dates: [String: Date] = [:]
        
        for dateString in stringDates {
            if let date = getDate(foramt: dateForamt, date: dateString) {
                dates[dateString] = date
            }
        }
        
        return dates
    }
    
    private func getDate(foramt:String, date:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = foramt
        dateFormatter.timeZone = TimeZone(identifier:"GMT")
        return dateFormatter.date(from: date)
    }
}
