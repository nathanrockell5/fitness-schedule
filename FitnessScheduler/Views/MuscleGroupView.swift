//
//  muscleGroupView.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 13/07/2022.
//

import SwiftUI

struct MuscleGroupView: View {
    let muscleGroup: MuscleGroup
    let day: String
    
    @Environment(\.dismiss) var dismiss
    
    @State private var searchText = ""
    
    let columns = [
        GridItem(.adaptive(minimum: 200))
    ]
    
    var body: some View {
        List{
            ForEach(muscleGroup.muscle){Muscle in
            Section(header: Text(Muscle.name)){
                ForEach(Muscle.matches(for: searchText)){Exercise in
                    NavigationLink{
                        ExerciseView(exercise: Exercise, day: day)
                    }label: {
                        VStack{
                            ExerciseRow(exercise: Exercise, muscleGroup: muscleGroup.image)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(muscleGroup.name)
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText)
    }
}

struct MuscleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        MuscleGroupView(muscleGroup: MuscleGroup.example, day: "Monday")
    }
}
