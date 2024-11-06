//
//  WalkthroughView.swift
//  TestCordin
//
//  Created by João Campos on 31/10/2024.
//

import SwiftUI

final class WalkthroughViewModel: ObservableObject {
}

struct WalkthroughView: View {

	@StateObject var vm: WalkthroughViewModel

	var body: some View {
		
		VStack {
			
			Spacer()
			
			Button {
				//
			} label: {
				Text("Get Started")
					.font(.title3)
					.foregroundStyle(.white)
					.padding(16)
			}
			.frame(maxWidth: .infinity)
			.background(Color.blue)
			.clipShape(.buttonBorder)
		}
		.padding(16)
	}
}
