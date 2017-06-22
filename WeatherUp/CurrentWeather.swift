//
//  CurrentWeather.swift
//  WeatherUp
//
//  Created by Diparth Patel on 3/23/17.
//  Copyright © 2017 Diparth Patel. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather{

    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil{
            _cityName = "N/A"
        }
        print("DEMO -- \(_cityName)")
        return _cityName
    }
    
    var date:String{
        get{
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            let currentDate = dateFormatter.string(from: Date())
            _date = "Today | \(currentDate)"
            
            return _date
        }
        set{
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            let currentDate = dateFormatter.string(from: Date())
            _date = "Today | \(currentDate)"
        }
    }
    
    var weatherType:String{
        if _weatherType == nil{
            _weatherType = "N/A"
        }
        print("DEMO -- \(_weatherType)")
        return _weatherType
    }
    
    var currentTemp:Double{
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        print("DEMO -- \(_currentTemp)")
        return _currentTemp
    }
    
    
//    func kelvinToFarenheit(kal: Double) -> Double{
//    
//        return ((9.0/5.0)(kal - 273.0) + 32.0)
//    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        //Alamofire download
        let currentWeatherURL = URL.init(string: CURRENT_WEATHER_URL)
        Alamofire.request(currentWeatherURL!).responseJSON { (response) in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, Any> {
            
                if let name = dict["name"] as? String{
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                if let weather = dict["weather"] as? [Dictionary<String, Any>]{
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                if let main = dict["main"] as? Dictionary<String, Any>{
                    if let currentTemperature = main["temp"] as? Double{
                        let temp = Double(9/5*(currentTemperature - 273) + 32)
                        self._currentTemp = Double(round(temp))
                        print(self._currentTemp)
                    }
                }
            }
            print("\(response)")
            completed()
        }
    }
}






