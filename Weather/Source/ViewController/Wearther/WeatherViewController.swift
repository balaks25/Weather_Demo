//
//  ViewController.swift
//  Weather
//
//  Created by Admin on 06/05/22.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var lookUpButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherViewModel: WeatherViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        initalization()
    }
    
    private func setupUI() {
        setupLookupButtonUI()
    }
    
    private func setupLookupButtonUI() {
        lookUpButton.setTitle("Lookup", for: .normal)
        lookUpButton.setTitleColor(.black, for: .normal)
        lookUpButton.backgroundColor = .clear
        lookUpButton.layer.cornerRadius = 10
        lookUpButton.layer.borderWidth = 1
        lookUpButton.layer.borderColor = UIColor(red: 144.0/255.0, green: 144.0/255.0, blue: 144.0/255.0, alpha: 1.0).cgColor
    }
    
    private func initalization() {
        weatherViewModel = WeatherViewModel()
    }
    
    private func getData(searchText: String) {
        weatherViewModel.getData(searchText)
        weatherViewModel.weatherContent.bind { [weak self] weatherContent in
            DispatchQueue.main.async {
                if weatherContent == nil {
                    self?.showFailureAlert()
                } else {
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let forecastListViewController = storyBoard.instantiateViewController(withIdentifier: "ForecastListViewController") as! ForecastListViewController
                    forecastListViewController.searchText = searchText
                    forecastListViewController.weatherContent = weatherContent
                    self?.navigationController?.pushViewController(forecastListViewController, animated: true)
                }
            }
        }
    }
    
    func showFailureAlert() {
        let alert = UIAlertController(title: "Weather", message: "Invalid City Name", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] action -> Void in
            self?.searchTextField.text = ""
            alert.dismiss(animated: true)
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func lookUpWearth() {
        if let searchText = searchTextField.text, searchText.isEmpty == false {
            self.getData(searchText: searchText)
        }
    }
}

