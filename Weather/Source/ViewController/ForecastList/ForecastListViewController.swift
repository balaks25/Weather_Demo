//
//  ForecastListViewController.swift
//  Weather
//
//  Created by Admin on 06/05/22.
//

import UIKit

class ForecastListViewController: UIViewController {

    @IBOutlet weak var forecastListTableView: ForecastListTableView!
    var searchText: String?
    var weatherContent: WeatherContent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalization()
        setUpNavigationBar()
        self.forecastListTableView.loadData(weatherContent)
    }
    
    private func initalization() {
        forecastListTableView.registerCards(self)
    }
    
    private func setUpNavigationBar() {
        let backButton = UIBarButtonItem()
        backButton.title = searchText?.capitalizingFirstLetter() ?? ""
        backButton.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
