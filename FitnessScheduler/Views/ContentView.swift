//
//  ContentView.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 30/06/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var menu = Menu()
    @StateObject var schedule = Schedule()
    
    @State private var showingAddScreen = false
    
    @State private var dayOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    @State public var day = "Monday"
    
    @Environment(\.dismiss) var dismiss2
    
    var body: some View {
        NavigationView{
            List{
                Section{
                    Picker("Day", selection: $day){
                        ForEach(dayOfWeek, id: \.self){
                            Text($0.prefix(3))
                        }
                    }
                    .pickerStyle(.segmented)
                }
//                Image("schedule-full-body")
//                    .resizable()
//                    .scaledToFit()
//                    .cornerRadius(50)
                Section{
                    ForEach(dayChosen().scheduleElements ?? []){
                            scheduleElement in
                        NavigationLink(destination:  CustomiseView(scheduleElement: scheduleElement, day: $day, sets: scheduleElement.sets, reps: scheduleElement.reps, weight: scheduleElement.weight){dismiss2()}, label: {ScheduleRow(scheduleElement: scheduleElement)})
                        
                            .swipeActions(edge: .trailing){
                                Button(role: .destructive){
                                    withAnimation{
                                        schedule.delete(scheduleElement, day: day)
                                    }
                                }label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                Section{
                    Button("Add Exercises"){
                        showingAddScreen = true
                    }
                }
            }
            .navigationTitle(day)
//            .toolbar{
//                ToolbarItem(placement: .principal){
//                    Picker("Day", selection: $day){
//                        ForEach(dayOfWeek, id: \.self){
//                            Text($0.prefix(3))
//                        }
//                    }
                    .pickerStyle(.segmented)
//                }
//            }
            .sheet(isPresented: $showingAddScreen){
                MenuView(day: $day)
            }
        }
        .environmentObject(menu)
        .environmentObject(schedule)
    }
        
    func dayChosen() -> DaySection{
        if let target = schedule.scheduleDays.first(where: {$0.name == day}) {
            return target
        }
        return schedule.scheduleDays[0]
    }
}
