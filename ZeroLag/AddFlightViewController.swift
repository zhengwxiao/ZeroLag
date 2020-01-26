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

var date = ""
var flightNumber = ""
var choice: Flight?

class AddFlightViewController: UIViewController {
    
    @IBOutlet weak var flightDatePicker: UIDatePicker!
    @IBOutlet weak var flightNumberTextField: UITextField!
    
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
        calculateSleep()
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
                    if flight.flightNumber == flightNumber {
                        choice = flight
                        //print(flight)
                    }
                }
            } catch let JsonErr {
                print("Error Serializing json:", JsonErr)
            }
            
        }.resume()
    }
    
    func calculateSleep() {
        var isEast:Bool
        let originTimeZone = (choice?.departureTime)?.suffix(6)
        let destinationTimeZone = (choice?.arrivalTime)?.suffix(6)
        guard let originTimeZoneTemp = originTimeZone?.prefix(3) else { return }
        guard let destinationTimeZoneTemp = destinationTimeZone?.prefix(3) else { return }
        guard let originTimeZoneInt = Int(String(originTimeZoneTemp)) else {return}
        guard let destinationTimeZoneInt = Int(String(destinationTimeZoneTemp)) else {return}
        var timeDifference = destinationTimeZoneInt - originTimeZoneInt
        if ((destinationTimeZoneInt - originTimeZoneInt) < 0) {
            isEast = false
            timeDifference = (timeDifference * -1) / 2
            getNewDate(isEast: isEast, timeDifference: timeDifference)
        }
        else  if ((destinationTimeZoneInt - originTimeZoneInt) > 0){
            isEast = true
            getNewDate(isEast: isEast, timeDifference: timeDifference)
        }
        else {
            timeDifference = 0;
            print("Same time zone, keep same sleep schedule")
        }
            
    }
    
    let startSleepTime = 22 // 10pm
    let endSleepTime = 6 // 6am
    
    func getNewDate(isEast:Bool, timeDifference:Int) {
        
        // HARDCODED TIME DIFF, NO INTERNATIONAL FLIGHTS IN AA API
        let timeDifference = 8
        
        guard var dateint = Int(date.suffix(2)) else {return}
        var newDate = [String](repeating: "", count: timeDifference)
        var newStartSleepTime = [Int](repeating: -1, count: timeDifference)
        var newEndSleepTime = [Int](repeating: -1, count: timeDifference)
        var multiplier = 1
        if !isEast {
            multiplier = 2
        }
        var n = 1
        print("tdiff: " + String(timeDifference))
        while(n <= timeDifference) {
            dateint = dateint - 1;
            newDate[n-1] = date.prefix(8) + String(dateint)
            newStartSleepTime[n-1] = (startSleepTime - (n * multiplier)) % 24
            newEndSleepTime[n-1] = (endSleepTime - (n * multiplier)) % 24
            n = n+1
        }
        print(newDate)
        print(newStartSleepTime)
        print(newEndSleepTime)
        
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
