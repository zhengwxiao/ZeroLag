//
//  AddFlightViewController.swift
//  ZeroLag
//
//  Created by Z Xiao on 1/26/20.
//  Copyright © 2020 Z Xiao. All rights reserved.
//

import UIKit

struct Flight: Decodable {
    let flightNumber: String
    let origin: origin
    let destination: destination
    let distance: Int
    let duration: duration
    let departureTime: String
    let arrivalTime: String
    let aircraft: aircraft
}

struct origin: Decodable {
    let code: String
    let city: String
    let timezone: String
    let location: location
}

struct destination: Decodable {
    let code: String
    let city: String
    let timezone: String
    let location: location
}

struct duration: Decodable {
    let locale: String
    let hours: Int
    let minutes: Int
}

struct aircraft: Decodable {
    let model: String
    let passengerCapacity: passengerCapacity
    let speed: Int
}

struct location: Decodable {
    let latitude: Double
    let longitude: Double
}

struct passengerCapacity: Decodable {
    let total: Int
    let main: Int
    let first: Int
}

class AddFlightViewController: UIViewController {
    
    @IBOutlet weak var flightDatePicker: UIDatePicker!
    @IBOutlet weak var flightNumberTextField: UITextField!
    var date = ""
    var flightNumber = ""
    var choice: Flight?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    @IBAction func searchPressed(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        date = formatter.string(from: flightDatePicker.date)
        flightNumber = flightNumberTextField.text!
        print(date)
        print(flightNumber)
        getFlight()
    }
    
    func getFlight() {
        let jsonUrlString = "https://noiseout.herokuapp.com/flights?date=\(date)"
        guard let url = URL(string: jsonUrlString) else
            {return}
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard let data = data else {return}
           // let dataAsString = String(data: data, encoding: .utf8)
           // print(dataAsString)
            do {
                let flightData = try JSONDecoder().decode([Flight].self, from: data)
                for flight in flightData {
                    if flight.flightNumber == self.flightNumber {
                        self.choice = flight
                        print(flight)
                    }
                }
            } catch let JsonErr {
                print("Error Serializing json:", JsonErr)
            }
            
        }.resume()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
