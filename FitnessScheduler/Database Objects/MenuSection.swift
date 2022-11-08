//
//  Category.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 01/07/2022.
//

import Foundation

//Struct for the different categories - Cardio and Strength
struct MenuSection: Identifiable, Codable{

    let id: UUID
    let name: String
    let muscleGroup: [MuscleGroup]
}
