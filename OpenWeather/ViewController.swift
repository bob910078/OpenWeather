//
//  ViewController.swift
//  OpenWeather
//
//  Created by bobchang on 2020/11/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let service = WeatherService()
        service.getCurrentWeatherData()
        
    }


}

