//
//  File.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 25/07/2022.
//

import Foundation

class Days: ObservableObject, Codable{
    let daySections: [DaySection]
    
    init() {
        
        do {
            let url = Bundle.main.url(forResource: "schedule", withExtension: "json")!
            let data = try Data(contentsOf: url)
            let res = JSONDecoder()
            res.keyDecodingStrategy = .convertFromSnakeCase
            let jsonData = try res.decode(Days.self, from:data)
            daySections = jsonData.daySections
            print(daySections)
        } catch {
            print("\(error)")
            fatalError("JSON Object Broken")
        }
    }
}
