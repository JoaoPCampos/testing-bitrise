//
//  Coordinator.swift
//  TestCordin
//
//  Created by João Campos on 07/11/2024.
//

import SwiftUI

protocol Coordinator: ObservableObject {

	associatedtype R: Codable, Hashable
	associatedtype D: View
	associatedtype V: View

	var navigationController: NavigationController { get set }

	@ViewBuilder @MainActor var rootView: V { get }
	@ViewBuilder @MainActor func coordinate(_ route: R) -> D
}

struct NavigationController {

	var navigationPath: NavigationPath = .init()

	mutating func push<T>(_ route: T) where T: Codable & Hashable {
		navigationPath.append(route)
	}

	mutating func dismiss() {
		
		guard !navigationPath.isEmpty else { return }
		navigationPath.removeLast()
	}
}

struct CoordinatedView<C: Coordinator>: View {
	
	@ObservedObject var coordinator: C

	var body: some View {

		NavigationStack(path: $coordinator.navigationController.navigationPath) {
			coordinator.rootView
		}
	}
}

final class FirstTabCoordinator: Coordinator, cenas {

	typealias R = Route

	enum Route: Codable, Hashable {

		var id: String { String(describing: self) }

		case detailView
	}

	@Published var navigationController = NavigationController()

	@ViewBuilder
	var rootView: some View {

		FirstView(viewModel: FirstViewModel(coordinator: self))
			.navigationDestination(for: Route.self) { [weak self] route in
				self?.coordinate(route)
			}
	}

	@ViewBuilder
	@MainActor
	func coordinate(_ route: Route) -> some View {

		switch route {

			case .detailView:
				FirstDetailView(viewModel: FirstDetailViewModel(coordinator: self))
		}
	}

	func goToDetailView() {
		navigationController.push(Route.detailView)
	}

	func dismiss() {
		navigationController.dismiss()
	}
}

protocol cenas {

	func goToDetailView()
	func dismiss()
}

struct FirstView: View {
	
	@StateObject var viewModel: FirstViewModel

	var body: some View {
		VStack {
			Text("First View")
			Button("Go to detail") {
				viewModel.didTapButton()
			}
		}
	}
}

final class FirstViewModel: ObservableObject {

	@Published var coordinator: cenas

	deinit {

		print("bye \(self)")
	}

	init(coordinator: cenas) {
		self.coordinator = coordinator

		print("hi \(self)")
	}

	func didTapButton() {
		coordinator.goToDetailView()
	}
}
