//
//  TextViewModel.swift
//  HomeWork6
//
//  Created by Vitaliy Voronok on 13.05.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

final class TextViewModel: ObservableObject {
    @Published var text: String = "" {
        didSet {
            convert()
        }
    }
    
    @Published var convertedText: String = ""
    
    @Published var locales = [Locale(identifier: "en_US"), Locale(identifier: "fr_FR"), Locale(identifier: "zh_CN")]
    
    @Published var selectedLocale = 0 {
        didSet {
            convert()
        }
    }
    
    var enLocale: Locale {
        return locales[0]
    }
    
    private func convert() {
        guard selectedLocale >= 0 && selectedLocale < locales.count else {
            return
        }
        let formatter = Formatter(locale: locales[selectedLocale])
        self.convertedText = formatter.format(text)
    }
}
