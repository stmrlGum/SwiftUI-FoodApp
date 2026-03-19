//
//  OnBoardingView.swift
//  Fodei
//
//  Created by Danil on 11.03.2026.
//

import SwiftUI

struct OnBoardingView: View {
    
    @StateObject var viewModel: OnBoardingViewModel
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            VStack(spacing: 0) {
                TabView(selection: $viewModel.page) {
                    ForEach(Array(viewModel.items.enumerated()), id: \.element.id) { index, item in
                        OnBoardingItem(item: item)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                HStack {
                    ClearButtonView(text: "Skip") {
                        viewModel.skip()
                    }
                    Spacer()
                    PageCounterView(
                        page: $viewModel.page,
                        totalPage: viewModel.items.count
                    )
                    Spacer()
                    Button {
                        viewModel.nextPage()
                    } label: {
                        Image("arrowButton")
                            .frame(height: 24)
                    }
                }
                .padding(.horizontal, 27)
            }
            .navigationDestination(for: Screens.self) { screen in
                switch screen {
                case .welcome:
                    ScreenFactory.makeWelcome()
                }
            }
        }
    }
}

#Preview {
    ScreenFactory.makeOnBoarding()
    
}
