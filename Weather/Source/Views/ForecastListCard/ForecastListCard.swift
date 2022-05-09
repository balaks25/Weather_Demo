//
//  ForecastListTableViewCell.swift
//  Weather
//
//  Created by Admin on 07/05/22.
//

import UIKit

class ForecastListCard: UITableViewCell {

    @IBOutlet weak var weatherLable: UILabel!
    @IBOutlet weak var temparatureLable: UILabel!
    
    var weather: Weather?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureWithData(_ weather: Weather?, main: Main?) {
        self.weather = weather
        self.weatherLable.text = weather?.main
        self.temparatureLable.text = "Temp: \(main?.temp ?? 0.0)"
    }

}
