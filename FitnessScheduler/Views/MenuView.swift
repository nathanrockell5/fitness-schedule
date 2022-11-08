//
//  MenuView.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 01/07/2022.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menu: Menu
    @Binding var day: String

    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    ForEach(menu.sections){MenuSection in
                        Section{
                            ForEach(MenuSection.muscleGroup){muscleGroup in
                                NavigationLink{
                                    MuscleGroupView(muscleGroup: muscleGroup, day: day)
                                }label: {
                                    VStack{
                                        Image(muscleGroup.image)
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(50)
                                        Text(muscleGroup.name)
                                    }
                                    .padding(.bottom)
                                    .font(.title2)
                                    .frame(alignment: .leading)
                                }
                                .buttonStyle(.plain)
                            }
                        }header: {
                            Text(MenuSection.name)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding([.top, .bottom, .trailing], 5)
                                .background(.background)
                                .font(.title)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    @State static var day = "Monday"
    static var previews: some View {
        MenuView(day: $day)
            .environmentObject(Menu())
    }
}
