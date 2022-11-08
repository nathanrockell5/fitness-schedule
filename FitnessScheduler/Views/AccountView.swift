//
//  AccountView.swift
//  FitnessScheduler
//
//  Created by Nathan Rockell on 27/07/2022.
//

import SwiftUI

struct AccountView: View {
    let accountInfo: AccountInfo
    var body: some View {
        NavigationView{
        List{
            Section{
                Text("Age: \(accountInfo.age)")
                Text("Weight: \(accountInfo.weight, specifier: "%.2f")")
                Text("Height: \(accountInfo.height, specifier: "%.2f")")
                }
            }
        .navigationTitle(accountInfo.name)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(accountInfo: AccountInfo.example)
    }
}
