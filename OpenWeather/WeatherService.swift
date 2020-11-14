//
//  WeatherService.swift
//  OpenWeather
//
//  Created by bobchang on 2020/11/14.
//

import Foundation

class WeatherService {
    
    func getCurrentWeatherData(cityName: String, completion: @escaping (CurrentWeatherModel?) -> Void) {
        
        let api_key = "05a1f2ada9a00ef2a30138d26e5814e4"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(api_key)"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (dataOrNil, responseOrNil, errorOrNil) in
            if let data = dataOrNil {
                
                do {
                    let dataModel = try JSONDecoder().decode(CurrentWeatherModel.self, from: data)
                    completion(dataModel)
                } catch {
                    completion(nil)
                }
                
            } else {
                print(errorOrNil!)
                completion(nil)
            }
        }
        
        task.resume()
        
    }
    
}
