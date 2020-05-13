//
//  ContentView.swift
//  HomeWork6
//
//  Created by Vitaliy Voronok on 13.05.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: TextModel
    
    var body: some View {
        Text("\(model.text)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
