//
//  FitnessSchedulerApp.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 30/06/2022.
//

import SwiftUI

@main
struct FitnessSchedulerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem{
                        Label("Schedule", systemImage: "calendar")
                    }
                AccountView(accountInfo: AccountInfo.example)
                    .tabItem{
                        Label("Account", systemImage: "person")
                    }
//                MenuView()
//                    .tabItem{
//                        Label("Menu", systemImage: "note")
//                }
            }
            
        }
    }
}
