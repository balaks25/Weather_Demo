//
//  ForecastDetailsViewController.swift
//  Weather
//
//  Created by Admin on 06/05/22.
//

import UIKit

class ForecastDetailsViewController: UIViewController {

    var searchText: String?
    var weather: Weather?
    var weatherMain: Main?
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelLikeLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setData()
    }
    
    func setData() {
        tempLabel.text = "\(weatherMain?.temp ?? 0.0)"
        feelLikeLabel.text = "Feel like: \(weatherMain?.feelsLike ?? 0.0)"
        mainLabel.text = weather?.main ?? ""
        descriptionLabel.text = weather?.weatherDescription ?? ""
    }
    
    private func setUpNavigationBar() {
        let backButton = UIBarButtonItem()
        backButton.title = searchText?.capitalizingFirstLetter() ?? ""
        backButton.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
