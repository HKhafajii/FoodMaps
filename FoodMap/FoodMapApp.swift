//
//  FoodMapApp.swift
//  FoodMap
//
//  Created by Hassan Alkhafaji on 11/11/23.
//

import SwiftUI

@main
struct FoodMapApp: App {
    @StateObject private var viewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(viewModel)
        }
    }
}
