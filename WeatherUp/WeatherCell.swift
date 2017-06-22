//
//  WeatherCell.swift
//  WeatherUp
//
//  Created by Diparth Patel on 3/26/17.
//  Copyright © 2017 Diparth Patel. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    
    
    func configureCell(forecast: Forecast) {
    
        weatherImage.image = UIImage.init(named: forecast.weatherType)
        weatherTypeLabel.text = forecast.weatherType
        dayLabel.text = forecast.date
        maxTemp.text = forecast.maxTemp
        minTemp.text = forecast.minTemp
    }

}
