//
//  Color.swift
//  CryptoScope
//
//  Created by CHURILOV DMITRIY on 02.05.2024.
//

import Foundation
import SwiftUI

extension Color {
	static let theme = ColorTheme()
}

struct ColorTheme {
	let accent = Color("AccentColor")
	let background = Color("BackgroundColor")
	let green = Color("GreenColor")
	let red = Color("RedColor")
	let secondaryText	 = Color("SecondaryTextColor")
}
