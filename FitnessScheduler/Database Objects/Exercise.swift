//
//  Exercise.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 30/06/2022.
//

import Foundation

struct Exercise: Identifiable, Codable {
    
    let id: UUID
    let name: String
    let difficulty: String
    let primarymuscles: [String]
    let secondarymuscles: [String]
    let steps: [String]
//    let image: String
    let equipment: String
    
    static let example = Exercise(id: UUID(), name: "Example Exercise", difficulty: "Example Difficulty", primarymuscles: ["Primary Muscle1", "Primary Muscle2"], secondarymuscles: ["Secondary Muscle1", "Secondary Muscle2"], steps: ["Step1", "Step2", "Step3"], equipment: "Example Equipment")
}
