//
//  ViewController.swift
//  OpenWeather
//
//  Created by bobchang on 2020/11/14.
//

import UIKit
import OpenWeatherService

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let myCity = "taipei"
        
        let service = WeatherService.shared
        service.getCurrentWeatherData(cityName: myCity) { dataModel in
            DispatchQueue.main.async {
                // update UI here ~
                if let model = dataModel, let weather = model.weather.first {
                    self.myTextLabel.text = weather.main
                    let imgURLstring = "https://openweathermap.org/img/wn/\(weather.icon).png"
                    self.updateImage(with: imgURLstring)
                } else {
                    self.myTextLabel.text = "No weather data."
                }
                
            }
        }
        
    }
    
    
    private func updateImage(with imageURL: String) {
        let url = URL(string: imageURL)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    self.myImageView.image = image
                } else {
                    self.myImageView.backgroundColor = .red
                }
            }
        }
        task.resume()
    }
    
    
}

