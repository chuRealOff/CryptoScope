//
//  HomeView.swift
//  CryptoScope
//
//  Created by CHURILOV DMITRIY on 03.05.2024.
//

import SwiftUI

struct HomeView: View {
	@State private var showPortfolio: Bool = false

	var body: some View {
		ZStack {
			Color.theme.background
				.ignoresSafeArea()

			VStack {
				headerView
				Spacer(minLength: 0)
			}
		}
	}
}

#Preview {
	NavigationView {
		HomeView()
	}
}

// MARK: - Custom Header View
extension HomeView {
	private var headerView: some View {
		HStack {
			CircleButtonView(iconName: showPortfolio ? "plus" : "info")
				.animation(.none, value: showPortfolio)
				.background {
					CircleButtonAnimationView(animate: $showPortfolio)
				}

			Spacer()

			Text(showPortfolio ? "Portfolio" : "Live Prices")
				.font(.headline)
				.fontWeight(.heavy)
				.foregroundStyle(Color.theme.accent)
				.animation(.none, value: showPortfolio)

			Spacer()

			CircleButtonView(iconName: "chevron.right")
				.rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
				.onTapGesture {
					withAnimation(.spring) {
						showPortfolio.toggle()
					}
				}
		}
		.padding(.horizontal)
	}
}
