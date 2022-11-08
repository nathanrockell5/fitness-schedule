//
//  ExerciseRow.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 14/07/2022.
//

import SwiftUI

struct ExerciseRow: View {
    var exercise: Exercise
    var muscleGroup: String
    
    var body: some View {
        HStack{
            Image(muscleGroup.lowercased())
                .resizable()
                .frame(width: 60, height: 60, alignment: .leading)
            VStack(alignment: .leading){
                Text(exercise.name).font(.headline)
                Text("\(Image(systemName: "gear.circle")) \(exercise.difficulty)").font(.body)
                Text("\(Image(systemName: "wrench.and.screwdriver")) \(exercise.equipment)").font(.body)
            }
        }
        
    }
}

struct ExerciseRow_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRow(exercise: Exercise.example, muscleGroup: "Arms")
    }
}
