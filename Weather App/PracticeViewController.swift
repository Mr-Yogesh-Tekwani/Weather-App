//
//  PracticeViewController.swift
//  Weather App
//
//  Created by Yogesh Tekwani on 5/21/23.
//

import UIKit


struct allWeather: Codable {
    let weather : [weatherS]
    let main : mainS
    let name: String = "Mumbai"// City Name
}

struct weatherS: Codable {
    let main : String
    let description : String
}

struct mainS : Codable{
    let temp: String
    let temp_min : Double
    let temp_max : Double
    let feels_like : Double
}

class PracticeViewController: UIViewController {
    
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

        let urlStr = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        
        if let url = URL(string: urlStr) {
            let task = URLSession.shared.dataTask(with: url) { [self] (data, _, error) in
                if let error = error {
                    print("Error:", error)
                    return
                }
                
                do {
                    let jsondecoder = JSONDecoder()
                    let decodedWeather = try jsondecoder.decode(allWeather.self, from: data!)
                    
                    let cityName = "Mumbai" //decodedWeather.name
                    let temp = decodedWeather.main.temp
                    let minTemp = decodedWeather.main.temp_min
                    let maxTemp = decodedWeather.main.temp_max
                    let haze = decodedWeather.weather.first?.main
                    let desc = decodedWeather.weather.first?.description
                    
                    print(cityName)
                    print(temp)
                    print(minTemp)
                    print(maxTemp)
                    print(haze)
                    print(desc)
                    
                    
                }
                catch {
                    print("Error catch:", error)
                }
                
            }
        }
        
        
    }

}
