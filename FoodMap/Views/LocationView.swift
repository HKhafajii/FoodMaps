//
//  LocationView.swift
//  FoodMap
//
//  Created by Hassan Alkhafaji on 11/15/23.
//

import SwiftUI
import MapKit


struct LocationView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
   
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
            }
//            Text($viewModel.mapLocation.name)
        }

    }
}

#Preview {
    LocationView()
        .environmentObject(LocationsViewModel())
}


extension LocationView {
    private var header: some View {
        VStack {
            Button(action: {
                viewModel.toggleLocationsList()
            }, label: {
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: viewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName:  "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: viewModel.showLocationsList ? 180 : 0))
                    }
                })
            if viewModel.showLocationsList {
                locationsListView()
            }
            
        }.background(.thickMaterial).cornerRadius(10)
            .shadow(color: .black.opacity(0.3), radius: 20, x: 0 ,y: 15 )
    }
}
