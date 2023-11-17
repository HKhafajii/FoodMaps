//
//  LocationsViewModel.swift
//  FoodMap
//
//  Created by Hassan Alkhafaji on 11/15/23.
//

import Foundation
import MapKit
import SwiftUI


class LocationsViewModel: ObservableObject {
//    All loaded locations
    @Published var locations: [Location]
    
//    Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
//    Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
//    Show list of locations
    @Published var showLocationsList: Bool = false
    
    let span =  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: span)
        }
        
    }
     func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
}
