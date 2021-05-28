//
//  WeatherCard.swift
//  CloneWeatherSwiftUI
//
//  Created by RX on 3/11/21.
//

import SwiftUI

struct WeatherCard: View {
    var weather: Weather
    
    var body: some View {
        VStack {
            HStack {
                Image(weather.weatherState)
                    .resizable().frame(width: 50, height: 50, alignment: .center)
                Text(UserDefaults.city)
                    .font(.title)
            }
            
            Spacer().frame(height: 40)
            
            Text("\(weather.theTemp)º")
                .font(.system(size: 90))
                .accessibility(identifier: "weather")
            
            Spacer().frame(height: 40)
            
            HStack {
                VStack {
                    Text("Minimum")
                    Text("\(weather.minTemp)º")
                }
                Divider().frame(height: 50)
                    .padding()
                VStack {
                    Text("Maximum")
                    Text("\(weather.maxTemp)º")
                }
                Divider().frame(height: 50)
                    .padding()
                VStack {
                    Text("Humidity")
                    Text("\(weather.humidity)º")
                }
            }
            .frame(height: 80)
        }
    }
}

struct WeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCard(weather: Weather.getDefault())
    }
}
