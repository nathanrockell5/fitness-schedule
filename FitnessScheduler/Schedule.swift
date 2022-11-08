//
//  Schedule.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 20/07/2022.
//

import Foundation
import UIKit
import SwiftUI

class Schedule: ObservableObject{
    @Published var scheduleDays: [DaySection]
    var days = Days()
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedScheduleElements")
    
    init(){
        do{
            let data = try Data(contentsOf: savePath)
            scheduleDays = try JSONDecoder().decode([DaySection].self, from: data)
        }catch{
            scheduleDays = days.daySections
        }
    }
    
    func save(){
        do{
            let data = try JSONEncoder().encode(scheduleDays)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        }catch{
            print("Unable to save data")
        }
    }
    
    func add(_ exercise: Exercise, day: String, sets: Double, reps: Double, weight: Double){
        let scheduleElement = ScheduleElement(id: UUID(), exercise: exercise, sets: sets, reps: reps, weight: weight)
        if let target = scheduleDays.firstIndex(where: {$0.name == day}) {
            if scheduleDays[target].scheduleElements == nil{
                scheduleDays[target].scheduleElements = []
                scheduleDays[target].scheduleElements!.append(scheduleElement)
                save()
            }else{
                scheduleDays[target].scheduleElements!.append(scheduleElement)
                save()
            }
        } else {
            print("Target Not Found")
        }
    }
    
    func delete(_ scheduleElement: ScheduleElement, day: String){
        if let target = scheduleDays.firstIndex(where: {$0.name == day}) {
            if let index = scheduleDays[target].scheduleElements?.firstIndex(of: scheduleElement){
                scheduleDays[target].scheduleElements!.remove(at: index)
            }
        } else {
            print("Target Not Found")
        }
            save()
    }
    
    func replace(_ scheduleElement: ScheduleElement, newElement: ScheduleElement, day: String){
        if let target = scheduleDays.firstIndex(where: {$0.name == day}) {
            if let index = scheduleDays[target].scheduleElements!.firstIndex(of: scheduleElement){
                scheduleDays[target].scheduleElements![index] = newElement
            }
        } else {
            print("Target Not Found")
        }
            save()
    }
}
