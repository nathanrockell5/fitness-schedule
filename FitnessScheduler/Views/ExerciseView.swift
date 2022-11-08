//
//  ExerciseView.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 13/07/2022.
//

import SwiftUI

struct ExerciseView: View {
    let exercise: Exercise
    let day: String
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var schedule: Schedule
    var body: some View {
        Form{
            Section{
//                Text(exercise.name).font(.headline)
                Image("arms")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(50)
//                Text("\(Image(systemName: "quote.opening")) \(exercise.name)")
                Text("\(Image(systemName: "gear.circle")) \(exercise.difficulty)")
                Text("\(Image(systemName: "wrench.and.screwdriver")) \(exercise.equipment)")
            }
            
            Section(header: Text("Primary Muscles")){
                ForEach(exercise.primarymuscles.indices, id: \.self) { Text(
                "\(exercise.primarymuscles[$0])") }
            }
            Section(header: Text("Secondary Muscles")){
                ForEach(exercise.secondarymuscles.indices, id: \.self) {
                    if(exercise.secondarymuscles[$0] == "Na"){
                        Text("")
                    }else{
                        Text("\(exercise.secondarymuscles[$0])")
                    }
                }
            }
            Section(header: Text("Steps")){
                ForEach(exercise.steps.indices, id: \.self) { Text(
                    "\($0+1): \(exercise.steps[$0])").padding(.bottom,5).padding(.top,5) }
            }
            Section{
                Button{
                    schedule.add(exercise, day: day, sets: 3, reps: 10, weight: 10)
                    dismiss()
                }label: {
                    Label("Add Exercise", systemImage: "plus")
                }
//                NavigationLink{
//                    CustomiseView(exercise: exercise){
//                        dismiss()
//                    }
//                }label: {
//                    Text("Add Exercise")
//                        .foregroundColor(Color.blue)
//                }
            }

        }
        .toolbar {
            Button{
                schedule.add(exercise, day: day, sets: 3, reps: 10, weight: 10)
                dismiss()
            }label: {
                Label("Add Exercise", systemImage: "plus")
            }
//            NavigationLink{
//                CustomiseView(exercise: exercise){
//                    dismiss()
//                }
//            }label: {
//                Label("Customise", systemImage: "plus")
//                    .foregroundColor(Color.blue)
//            }
        }
        .navigationTitle(exercise.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exercise: Exercise.example, day: "Monday")
            .previewInterfaceOrientation(.portrait)
    }
}
