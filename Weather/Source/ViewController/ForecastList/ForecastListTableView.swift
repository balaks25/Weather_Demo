//
//  ForecastListTableView.swift
//  Weather
//
//  Created by Admin on 09/05/22.
//

import Foundation
import UIKit

class ForecastListTableView: UITableView {
    
    private var parentViewController: ForecastListViewController!
    let reuseIdentifier = String(describing: ForecastListCard.self)
    private var weatherContent: WeatherContent?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        bounces = true
        self.dataSource = self
        self.delegate = self
    }
    
    func registerCards(_ parentViewController: ForecastListViewController) {
        self.parentViewController = parentViewController
        self.parentViewController.forecastListTableView.register(UINib(nibName: reuseIdentifier, bundle: Bundle.main), forCellReuseIdentifier: reuseIdentifier)
    }
    
    func loadData(_ weatherContent: WeatherContent?) {
        guard let weatherContent = weatherContent else {
            return
        }

        self.weatherContent = weatherContent
        self.reloadForecastListTableView()
    }
    
    private func reloadForecastListTableView() {
        UIView.performWithoutAnimation {
            self.reloadData()
        }
    }
}

extension ForecastListTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherContent?.weather.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ForecastListCard
        cell.backgroundColor = .clear
        cell.configureWithData(weatherContent?.weather[indexPath.row], main: weatherContent?.main)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension ForecastListTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToForecastDetails(weather: weatherContent?.weather[indexPath.row], weatherMain: weatherContent?.main)
    }
    
    func navigateToForecastDetails(weather: Weather?, weatherMain: Main?) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let forecastDetailsViewController = storyBoard.instantiateViewController(withIdentifier: String(describing: ForecastDetailsViewController.self)) as! ForecastDetailsViewController
        forecastDetailsViewController.searchText = parentViewController.searchText
        forecastDetailsViewController.weather = weather
        forecastDetailsViewController.weatherMain = weatherMain
        parentViewController.navigationController?.pushViewController(forecastDetailsViewController, animated: true)
    }
}
