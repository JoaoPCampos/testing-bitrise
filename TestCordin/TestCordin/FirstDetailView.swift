//
//  FirstDetailView.swift
//  TestCordin
//
//  Created by João Campos on 07/11/2024.
//

import SwiftUI

struct FirstDetailView: View {

	let viewModel: FirstDetailViewModel

	var body: some View {
		Button("dismiss") {
			viewModel.dismiss()
		}
    }
}

@Observable class FirstDetailViewModel {

	private let coordinator: FirstTabCoordinator

	init(coordinator: FirstTabCoordinator) {
		self.coordinator = coordinator
	}

	func dismiss() {
		coordinator.dismiss()
	}
}

#Preview {
    FirstDetailView(viewModel: FirstDetailViewModel(coordinator: FirstTabCoordinator()))
}
