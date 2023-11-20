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
    
//    Show a location detail via sheet
    @Published var sheetLocation: Location? = nil
    
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
    
    func nextButtonPress() {
//        Get the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {
            print("Could not find current index in locations array! Should never happen.")
            return
        }
//        Check if current index is valid
         let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
//            Next index is not valid
//            Restart from 0
            guard let firstLocation = locations.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
//        Next index IS valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
        
    }
    
}
