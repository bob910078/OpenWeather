//
//  WeatherService.swift
//  OpenWeather
//
//  Created by bobchang on 2020/11/14.
//

import Foundation

class WeatherService {
    
    func getCurrentWeatherData() {
        
        let cityName = "taipei"
        let api_key = "05a1f2ada9a00ef2a30138d26e5814e4"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(api_key)"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (dataOrNil, responseOrNil, errorOrNil) in
            if let data = dataOrNil {
                print(String(data: data, encoding: .utf8))
            } else {
                print(errorOrNil!)
            }
        }
        
        task.resume()
        
    }
    
}
