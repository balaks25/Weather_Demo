//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Admin on 09/05/22.
//

import Foundation

class WeatherViewModel: NSObject {
    private var apiService : APIService!
    var weatherContent = Bindable<WeatherContent>()
   
    override init() {
        super.init()
        self.apiService =  APIService()
    }
    
    func getData(_ searchText: String?) {
        self.apiService.getWeatherData(searchText: searchText) { [weak self] (weatherContent, error) in
            self?.weatherContent.value = weatherContent
        }
    }
}
