//
//  Development.swift
//  Weather
//
//  Created by Admin on 09/05/22.
//

import Foundation

class DevelopmentConfiguration {
    
    static var URL: String {
        return "https://api.openweathermap.org/data/\(APIVersionID)"
    }
    
    static var baseURL: String {
        return "https://api.openweathermap.org/data/"
    }
    
    static var APIVersionID: String {
        return "2.5/"
    }
    
    static var openWeatherAPIKey: String {
        return "65d00499677e59496ca2f318eb68c049"
    }
}

