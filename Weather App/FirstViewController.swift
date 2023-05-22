//
//  FirstViewController.swift
//  Weather App
//
//  Created by Yogesh Tekwani on 5/19/23.
//

import UIKit

struct WeatherResponse: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Weather: Codable {
    let description: String
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

class FirstViewController: UIViewController {

    let label1 : UILabel = {
       let l1 = UILabel()
        l1.text = "Temperature: "
        l1.textColor = .systemBlue
        l1.font = UIFont(name: "Times New Roman", size: 33)
        return l1
    }()

    let label2 : UILabel = {
       let l1 = UILabel()
        l1.text = "Weather: "
        l1.textColor = .systemBlue
        l1.font = UIFont(name: "Times New Roman", size: 33)
        return l1
    }()

    let mainstack : UIStackView = {
        let ms = UIStackView()
        ms.distribution = .fillEqually
        ms.axis = .vertical
        ms.alignment = .center
        ms.backgroundColor = .black
        return ms
    }()

    
    var city : String = ""
    var label1text : String = "No Data recieved from API ;("
    var label2text : String = "No Data recieved from API ;("
    var label3text : String = "No Data recieved from API ;("
    var label4text : String = "No Data recieved from API ;("
    
    
    let apiKey = "65d00499677e59496ca2f318eb68c049"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func fetchWeatherData() {
            let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
            
            if let url = URL(string: urlString) {
                let task = URLSession.shared.dataTask(with: url) { [self] (data, _, error) in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let weatherResponse = try decoder.decode(WeatherResponse.self, from: data!)
                    
                    
                    let temperature = weatherResponse.main.temp
                    let minTemperature = weatherResponse.main.temp_min
                    let maxTemperature = weatherResponse.main.temp_max
                    let cityName = weatherResponse.name
                    let weatherDescription = weatherResponse.weather.first?.description ?? ""
                    
                    let formattedTemperature = String(format: "%.1f°C", temperature - 273.15)
                    let formattedMinTemperature = String(format: "%.1f°C", minTemperature - 273.15)
                    let formattedMaxTemperature = String(format: "%.1f°C", maxTemperature - 273.15)
                    
                    
                    label1text = ("Current Temperature: \(formattedTemperature)")
                    label2text = ("Weather: \(weatherDescription)")
                    label3text = ("Min Temperature: \(formattedMinTemperature)")
                    label4text = ("Max Temperature: \(formattedMaxTemperature)")
                    
                    DispatchQueue.main.async{ [self] in
                        self.label1.text = label1text
                        self.label2.text = label2text
                        
                    }
                    
                    print("City: \(cityName)")
                    print("Current Temperature: \(formattedTemperature)")
                    print("Min Temperature: \(formattedMinTemperature)")
                    print("Max Temperature: \(formattedMaxTemperature)")
                    print("Weather: \(weatherDescription)")
                } catch {
                    print("Error decoding weather data: \(error)")
                }
                
            
        }
            task.resume()
            }
        }
        
        fetchWeatherData()
        label1.text = label1text
        label2.text = label2text
        
        mainstack.addArrangedSubview(label1)
        mainstack.addArrangedSubview(label2)
        
        self.view.addSubview(mainstack)
        
        mainstack.translatesAutoresizingMaskIntoConstraints = false

        let safeArea = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            mainstack.topAnchor.constraint(equalTo: safeArea.topAnchor),
            mainstack.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            mainstack.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            mainstack.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)

        ])
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        let svc = SecondViewController()
        svc.label3text = self.label3text
        svc.label4text = self.label4text
        navigationController?.pushViewController(svc, animated: true)
        }

}

