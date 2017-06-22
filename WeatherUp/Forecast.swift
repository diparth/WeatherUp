//
//  Forecast.swift
//  WeatherUp
//
//  Created by Diparth Patel on 3/24/17.
//  Copyright © 2017 Diparth Patel. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {

    private var _date: String!
    private var _weatherType: String!
    private var _maxTemp: String!
    private var _minTemp: String!
    
    
    var date : String{
        get{
            return _date
        }
        set{
            _date = date
        }
    }
    
    var weatherType: String{
        get{
            return _weatherType
        }
        set{
            _weatherType = weatherType
        }
    }
    
    var maxTemp: String{
        get{
            return _maxTemp
        }
        set{
            _maxTemp = maxTemp
        }
    }
    
    var minTemp: String{
        get{
            return _minTemp
        }
        set{
            _minTemp = minTemp
        }
    }
    
    init(weatherObj: Dictionary<String, Any>) {
        
        if let temp = weatherObj["temp"] as? Dictionary<String, Any>{
        
            if let min = temp["min"] as? Double{
                self._minTemp = "\(Double(round(9/5*(min - 273) + 32)))"
            }
            if let max = temp["max"] as? Double{
                self._maxTemp = "\(Double(round(9/5*(max - 273) + 32)))"
            }
        }
        if let weather = weatherObj["weather"] as? [Dictionary<String, Any>]{
        
            if let main = weather[0]["main"] as? String{
                self._weatherType = main
            }
        }
        if let date = weatherObj["dt"] as? Double{
            let unixConvertedDate = Date.init(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
            
        }
    }
}


extension Date{

    func dayOfTheWeek() -> String {
    
        let dateformatter = DateFormatter()
        
        dateformatter.dateFormat = "EEEE"
        
        return dateformatter.string(from: self)
    }
}






