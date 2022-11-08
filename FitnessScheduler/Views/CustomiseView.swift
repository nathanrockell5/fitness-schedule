//
//  CustomiseView.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 24/07/2022.
//

import SwiftUI

struct CustomiseView: View {
    
    @EnvironmentObject var schedule: Schedule
    @State var scheduleElement: ScheduleElement
    @Binding var day: String
    @State public var sets: Double
    @State public var reps: Double
    @State public var weight: Double
    @State private var isEditing1 = false
    @State private var isEditing2 = false
    @State private var isEditing3 = false
    @FocusState private var focusedWeight: Bool
    
    let dismiss: () -> Void
    
    var body: some View {
        Form{
            Section{
                Text("Sets: \(sets, specifier: "%.0f")")
                    .font(.title2)
                    .foregroundColor(isEditing1 ? .blue :.primary)
                HStack{
                    Text("1")
                    Slider(value: $sets, in: 1.00...30.00, step: 1.00, onEditingChanged: {editing in
                        isEditing1 = editing
                        }
                    )
                    Text("30")
                }
                Text("Reps: \(reps, specifier: "%.0f")")
                    .font(.title2)
                    .foregroundColor(isEditing2 ? .blue :.primary)
                HStack{
                    Text("1")
                    Slider(value: $reps, in: 1.00...30.00, step: 1.00, onEditingChanged: {editing in
                        isEditing2 = editing
                        }
                    )
                    Text("30")
                }
                
                HStack{
                    Text("Weight:")
                        .font(.title2)
                        .foregroundColor(isEditing3 ? .blue: .primary)
//                    Picker("Weight", selection: $weight){
//                        let weights = Array(1...500)
//                        ForEach(weights, id: \.self){
//                            Text("\($0) Kg")
//                        }
//                    }
//                    .pickerStyle(.wheel)
//                    .labelsHidden()
                    TextField("Input Weight", value: $weight, format: .number)
                        .frame(alignment: .trailing)
                        .font(.title2)
                        .foregroundColor(isEditing3 ? .blue: .primary)
                        .focused($focusedWeight)
                        .keyboardType(.decimalPad)
                        .overlay(Rectangle().frame(height: 2).padding(.top, 35))
                        .toolbar{
                            ToolbarItem(placement: .keyboard){
                                Button("Done"){
                                    focusedWeight = false
                                }
                            }
                        }
                }
                HStack{
                    Text("0")
                    Slider(value: $weight, in: 0.00...250.00, step: 2.50, onEditingChanged: {editing in
                        isEditing3 = editing
                        })
                    Text("250")
                }
                
            }
            Section{
                Button("Save Changes"){
                    let newScheduleElement = ScheduleElement(id: UUID(), exercise: scheduleElement.exercise, sets: sets, reps: reps, weight: weight)
                    schedule.replace(scheduleElement, newElement: newScheduleElement, day: day)
                    dismiss()
                }
            }
        }
        .navigationTitle(scheduleElement.exercise.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CustomiseView_Previews: PreviewProvider {
    @State static var day = "Monday"
    static var previews: some View {
        CustomiseView(scheduleElement: ScheduleElement.example, day: $day, sets: 10, reps: 10, weight: 10) { }
    }
}
