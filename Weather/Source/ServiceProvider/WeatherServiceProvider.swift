//
//  WeatherServiceProvider.swift
//  Weather
//
//  Created by Admin on 07/05/22.
//

import Foundation

class APIService :  NSObject {
    
    func getWeatherData(searchText: String?, completion: @escaping (WeatherContent?, NSError?) -> ()){
        
        guard let searchText = searchText else {
            completion(nil, nil)
            return
        }

        let urlString = "\(DevelopmentConfiguration.URL)weather?q=\(searchText)&appid=\(DevelopmentConfiguration.openWeatherAPIKey)&units=metric"
        let sourcesURL = URL(string:urlString)!
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                if let successResponse = try? JSONDecoder().decode(WeatherContent.self, from: data) {
                    completion(successResponse, nil)
                } else if let responseError = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                    completion(nil, NSError(domain: "", code: Int(responseError.cod) ?? 0 , userInfo: ["ErrorObject": responseError.message]))
                }
            }
        }.resume()
    }
}

