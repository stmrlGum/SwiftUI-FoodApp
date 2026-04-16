//
//  HomeView.swift
//  Fodei
//
//  Created by Danil on 26.03.2026.
//

import SwiftUI
import CoreLocation

struct HomeView: View {
    
    @State var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                headerView
                    .padding(.bottom, 16)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        SearchBarView(text: $viewModel.searchText, style: .gray)
                            .padding(.horizontal, 48)
                        topСarouselView
                            .padding(.top, 28)
                        middleSectionView
                            .padding(.horizontal, 17)
                            .padding(.top, 36)
                        middleСarouselView
                            .padding(.top, 16)
                        bottomSectionView
                            .padding(.horizontal, 17)
                            .padding(.top, 36)
                        bookingItems
                            .padding(.top, 16)
                            .padding(.bottom, 26)
                    }
                }
            }
            .background(Color(#colorLiteral(red: 0.9719485641, green: 0.9719484448, blue: 0.9719485641, alpha: 1)))
            .navigationDestination(isPresented: $viewModel.isShowMap) {
                if let coord = viewModel.selectedCoordinate {
                    ScreenFactory.makeMap(routeCoordinates: coord)
                        .onDisappear {
                            viewModel.isShowMap = false
                        }
                        .toolbar(.hidden, for: .navigationBar)
                }
            }
        }
    }
    
    private func openMap(position: CLLocationCoordinate2D) {
        viewModel.selectedCoordinate = position
        viewModel.isShowMap = true
    }
}

private extension HomeView {
    var headerView: some View {
        HStack(spacing: 0) {
            Image("extras")
            Spacer()
            Image("map")
            Text("Agrabad 435, Chittagong")
                .font(.interMedium(size: 12))
                .padding(.leading, 4)
            Spacer()
            Image("avatar")
                .resizable()
                .scaledToFit()
                .clipShape(.circle)
                .frame(width: 24, height: 24)
            
        }
        .padding(.horizontal, 17)
    }
}

private extension HomeView {
    var topСarouselView: some View {
        VStack(alignment: .center, spacing: 0) {
            ScrollView(.horizontal) {
                HStack(spacing: 11) {
                    ForEach(Array(viewModel.topСarouselItems.enumerated()), id: \.element.id) { index, item in
                        TopCaruselItem(item: item) {
                            openMap(position: item.position)
                        } .id(index)
                    }
                }
                .frame(height: 120)
                .padding(.leading, 40)
                .padding(.trailing, 40)
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $viewModel.currentPage)
            .scrollIndicators(.hidden)
            PageCounterView(page: $viewModel.currentPage, totalPage: viewModel.topСarouselItems.count)
        }
    }
}

private extension HomeView {
    var middleSectionView: some View {
        SectionHeader(title: "Today New Arivable", subtitle: "Best of the today food list update") {
            print("see all")
        }
    }
    
    var middleСarouselView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(viewModel.middleСarouselItems) { item in
                    MiddleCaruselItem(item: item) {
                        openMap(position: item.position)
                    }
                }
            }
            .frame(height: 196)
            .padding(.leading, 18)
            .padding(.trailing, 18)
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .scrollIndicators(.hidden)
    }
}

private extension HomeView {
    var bottomSectionView: some View {
        SectionHeader(title: "Today New Arivable", subtitle: "Best of the today food list update") {
            print("see all")
        }
    }
    
    var bookingItems: some View {
        VStack(spacing: 6) {
            ForEach(viewModel.bookingItems) { item in
                BookingItem(item: item, style: .booking) {
                    print(item.restaurant)
                }
            }
        }
        .scrollTargetLayout()
    }
}

#Preview {
    ScreenFactory.makeHomeView()
}

