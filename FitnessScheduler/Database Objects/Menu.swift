//
//  menu.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 01/07/2022.
//

import Foundation

class Menu: ObservableObject, Codable{
    let sections: [MenuSection]
    
    init() {
        do {
            let url = Bundle.main.url(forResource: "database", withExtension: "json")
            let data = try Data(contentsOf: url!)
            let res = JSONDecoder()
            res.keyDecodingStrategy = .convertFromSnakeCase
            let jsonData = try res.decode(Menu.self, from:data)
            sections = jsonData.sections
        } catch {
            print("\(error)")
            fatalError("JSON Object Broken")
        }
    }
}
