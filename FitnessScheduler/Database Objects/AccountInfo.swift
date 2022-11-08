//
//  AccountInfo.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 03/08/2022.
//

import Foundation

struct AccountInfo{
    
    let id: UUID
    let name: String
    let age: Int
    let height: Double
    let weight: Double
    
    static let example = AccountInfo(id: UUID(), name: "Nathan Rockell", age: 20, height: 187.96, weight: 74)
}
