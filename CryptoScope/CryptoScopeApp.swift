//
//  CryptoScopeApp.swift
//  CryptoScope
//
//  Created by CHURILOV DMITRIY on 02.05.2024.
//

import SwiftUI

@main
struct CryptoScopeApp: App {
    var body: some Scene {
        WindowGroup {
			NavigationView {
				HomeView()
					.navigationBarHidden(true)
			}
        }
    }
}
