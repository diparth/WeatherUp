//
//  WeatherViewController.swift
//  WeatherUp
//
//  Created by Diparth Patel on 3/22/17.
//  Copyright © 2017 Diparth Patel. All rights reserved.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var currentDateLabel: UILabel!
    @IBOutlet var currentTempLabel: UILabel!
    @IBOutlet var weatherStatusLabel: UILabel!
    @IBOutlet var currentCityLabel: UILabel!
    @IBOutlet var weatherimage: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    var curWeathr : CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        curWeathr = CurrentWeather()
        
        curWeathr.downloadWeatherDetails {
            print("Inside..")
            self.forecastDataDownload {
                self.updateUI()
            }
        }
    }
    
    func forecastDataDownload(completed: @escaping DownloadComplete){
    
        let weatherForecastURL = URL.init(string: FORECAST_WEATHER_URL)
        Alamofire.request(weatherForecastURL!).responseJSON { (response) in
            print("\(response)")
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, Any>{
            
                if let list = dict["list"] as? [Dictionary<String, Any>]{
                    
                    for obj in list{
                        let forecast = Forecast(weatherObj: obj)
                        self.forecasts.append(forecast)
                        print(forecast.date)
                        print(self.forecasts.count)
                    }
                    self.tableView.reloadData()
                }
            }
            
            completed()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.forecasts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? WeatherCell {
            let forecast = self.forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return WeatherCell()
        }
    }
    
    
    func updateUI(){
    
        currentDateLabel.text = curWeathr.date
        currentCityLabel.text = curWeathr.cityName
        currentTempLabel.text = "\(curWeathr.currentTemp)° F"
        weatherStatusLabel.text = curWeathr.weatherType
        weatherimage.image = UIImage.init(named: "\(curWeathr.weatherType).png")
        print(curWeathr.cityName)

    }
    
}

