//
//  ScheduleElement.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 20/07/2022.
//

import Foundation

struct ScheduleElement: Identifiable, Codable, Equatable {
    static func == (lhs: ScheduleElement, rhs: ScheduleElement) -> Bool {
        let areEqual = lhs.id == rhs.id
        return areEqual
    }
    
    var id: UUID
    let exercise: Exercise
    var sets: Double
    let reps: Double
    let weight: Double
    
    static let example = ScheduleElement(id: UUID(), exercise: Exercise.example, sets: 3, reps: 10, weight: 20)
}
