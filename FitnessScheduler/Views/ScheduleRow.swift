//
//  ScheduleRowView.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 26/07/2022.
//

import SwiftUI

struct ScheduleRow: View {
    var scheduleElement: ScheduleElement
    
    var body: some View {
        HStack{
            Image("schedule-full-body")
                .resizable()
                .frame(width: 60, height: 60, alignment: .leading)
        VStack(alignment: .leading){
            Text(scheduleElement.exercise.name)
                .font(.headline)
            Divider()
            VStack(alignment: .leading){
                Text("\(Image(systemName: "rectangle.stack"))   \(scheduleElement.sets, specifier: "%.0f")")
                    Text("\(Image(systemName: "gobackward"))   \(scheduleElement.reps, specifier: "%.0f")")
                    Text("\(Image(systemName: "scalemass"))   \(scheduleElement.weight, specifier: "%.2f")")
                }
        }
        .padding(5)
        }
    }
}

struct ScheduleRow_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleRow(scheduleElement: ScheduleElement.example)
    }
}
