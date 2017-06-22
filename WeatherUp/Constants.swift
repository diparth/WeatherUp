//
//  Constants.swift
//  WeatherUp
//
//  Created by Diparth Patel on 3/23/17.
//  Copyright © 2017 Diparth Patel. All rights reserved.
//

import Foundation

// Sample current location API URL: http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=59c0a34e7a9b24a1e50bcc67078eb635

let WAPP_KEY = "59c0a34e7a9b24a1e50bcc67078eb635"
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid=\(WAPP_KEY)"

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=40.5684&lon=-74.5385&appid=59c0a34e7a9b24a1e50bcc67078eb635"
let FORECAST_WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=40.5684&lon=-74.5385&cnt=10&appid=59c0a34e7a9b24a1e50bcc67078eb635"

typealias DownloadComplete = () -> ()


