//
//  MuscleGroup.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 01/07/2022.
//

import Foundation

struct MuscleGroup: Identifiable, Codable {
    
    let id: UUID
    let name: String
    let muscle: [Muscle]
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    
    static let example = MuscleGroup(id: UUID(), name: "Example Muscle Group", muscle: [Muscle.example])
    
}
