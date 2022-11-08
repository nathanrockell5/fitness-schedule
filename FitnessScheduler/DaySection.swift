//
//  DayElement.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 25/07/2022.
//

import Foundation

struct DaySection: Identifiable, Codable{
    let id: UUID
    var name: String
    var scheduleElements: [ScheduleElement]?

}
