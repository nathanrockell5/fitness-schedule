//
//  Muscle.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 01/07/2022.
//

import Foundation

struct Muscle: Identifiable, Codable {
    
    let id: UUID
    let name: String
    let exercises: [Exercise]
    
    func matches(for search: String) -> [Exercise]{
        let trimmed = search.trimmingCharacters(in: .whitespaces)
        if trimmed.isEmpty {return exercises}
        
        return exercises.filter{
            $0.name.localizedCaseInsensitiveContains(search)}
    }
    
    
    static let example = Muscle(id: UUID(), name: "Example Muscle", exercises: [Exercise.example])
    
}
