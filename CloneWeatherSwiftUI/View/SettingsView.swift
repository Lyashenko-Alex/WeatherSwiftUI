//
//  SettingsView.swift
//  CloneWeatherSwiftUI
//
//  Created by RX on 5/28/21.
//

import SwiftUI

struct SettingsView: View {
    let cities = ["San Paulo", "Rio de Janeiro", "Salvador"]
    @ObservedObject var settingsStore: SettingsStore
    
    var body: some View {
        Form {
            Section(header: Text("Location")) {
                Picker(selection: $settingsStore.city, label: Text("City"), content: {
                    ForEach(0..<cities.count) {
                        Text(cities[$0])
                            .tag(cities[$0])
                    }
                })
            }
        }
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settingsStore: SettingsStore())
    }
}
