//
//  locationsListView.swift
//  FoodMap
//
//  Created by Hassan Alkhafaji on 11/16/23.
//

import SwiftUI

struct locationsListView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button(action: {
                    viewModel.showNextLocation(location: location)
                }, label: {
                     listRowView(location: location)
                    })
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
               
                
            }
            
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    locationsListView()
        .environmentObject(LocationsViewModel())
}

extension locationsListView {
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imagename = location.imageNames.first {
                Image(imagename)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment:.leading)
            
        }
    }
}
