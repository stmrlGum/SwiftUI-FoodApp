//
//  OnBoardingView.swift
//  Fodei
//
//  Created by Danil on 11.03.2026.
//

import SwiftUI

struct OnBoardingView: View {
    
    @Binding var path: NavigationPath
    @State var viewModel: OnBoardingViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $viewModel.page) {
                ForEach(Array(viewModel.items.enumerated()), id: \.element.id) { index, item in
                    OnBoardingItem(item: item)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            HStack(spacing: 0) {
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
                    withAnimation(.easeInOut(duration: 0.25)) {
                        viewModel.nextPage()
                    }
                } label: {
                    Image("arrowButton")
                        .frame(height: 24)
                }
            }
            .padding(.horizontal, 27)
        }
        .onAppear {
            viewModel.onNext = {
                path.append(OnBoardingRoute.welcome)
            }
        }
    }
}

#Preview {
    ScreenFactory.makeOnBoarding(path: .constant(NavigationPath()))
    
}
