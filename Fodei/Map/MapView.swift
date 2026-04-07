//
//  MapView.swift
//  Fodei
//
//  Created by Danil on 06.04.2026.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    @State var viewModel: MapViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .top) {
            Map(position: .constant(.region(viewModel.region))) {
                Annotation("", coordinate: viewModel.routeCoordinates) {
                    MapActivePoint()
                }
            }
            .mapStyle(.standard(elevation: .flat))
            .mapControls { }
            mapHeader
        }
    }
}

private extension MapView {
    var mapHeader: some View {
        HStack {
            Button {
             dismiss()
            } label: {
                Image("backButtonBlack")
            }
            SearchBarView(text: $viewModel.searchText, style: .white)
                .padding(.leading, 18)
                .padding(.trailing, 30)
            Image("avatar")
                .resizable()
                .scaledToFit()
                .clipShape(.circle)
                .frame(width: 32, height: 32)
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    ScreenFactory.makeMap(routeCoordinates: CLLocationCoordinate2D(latitude: 59.437, longitude: 24.7536))
}
