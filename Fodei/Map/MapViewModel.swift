//
//  MapViewModel.swift
//  Fodei
//
//  Created by Danil on 06.04.2026.
//

import CoreLocation
import MapKit

@Observable final class MapViewModel {
    
    var searchText = ""
    var routeCoordinates: CLLocationCoordinate2D
    var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 1000, longitudeDelta: 1000))
    
    init(routeCoordinates: CLLocationCoordinate2D) {
        self.routeCoordinates = routeCoordinates
        getRegion(for: "Vladivostok")
    }
    
    func getRegion(for city: String) {
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(city) { placemarks, error in
            guard let placemark = placemarks?.first,
                  let location = placemark.location else {
                return
            }
            
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )
        }
    }
}
