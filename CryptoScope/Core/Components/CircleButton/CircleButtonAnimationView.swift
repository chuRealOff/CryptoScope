//
//  CircleButtonAnimationView.swift
//  CryptoScope
//
//  Created by CHURILOV DMITRIY on 03.05.2024.
//

import SwiftUI

struct CircleButtonAnimationView: View {
	@Binding var animate: Bool

    var body: some View {
        Circle()
			.stroke(lineWidth: 2)
			.scale(animate ? 2.0 : 0.0)
			.opacity(animate ? 0.0 : 1.0)
			.animation(animate ? .easeInOut(duration: 1.0) : .none, value: animate)
    }
}

#Preview {
	CircleButtonAnimationView(animate: .constant(false))
		.foregroundStyle(.red)
		.frame(width: 100, height: 100)
}
