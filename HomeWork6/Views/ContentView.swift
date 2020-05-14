//
//  ContentView.swift
//  HomeWork6
//
//  Created by Vitaliy Voronok on 13.05.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: TextViewModel
    
    var body: some View {
        Form {

            Picker("Options", selection: $viewModel.selectedLocale) {
                ForEach(0 ..< viewModel.locales.count) { index in
                    Text(self.viewModel.enLocale.localizedString(forIdentifier:self.viewModel.locales[index].languageCode ?? "") ?? "")
                        .tag(index)
                }

            }.pickerStyle(SegmentedPickerStyle())
            
            Section(header: Text("Source")) {
                Text("\(viewModel.text)")
                    .background(Color.gray)
            }
            
            Section(header: Text("Converted")) {
                Text("\(viewModel.convertedText)")
                    .background(Color.green)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
