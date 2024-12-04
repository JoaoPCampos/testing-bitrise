//
//  TestCordinTests.swift
//  TestCordinTests
//
//  Created by João Campos on 04/12/2024.
//

import Testing
@testable import TestCordin

struct TestCordinTests {

    @Test
	func example() async throws {

		var mockedCoordinator = CoordingatorMock()
		var numberOfCalls = 0

		mockedCoordinator.goToDetailViewCallback = { value in
			#expect(value == true)
			numberOfCalls += 1
		}

		mockedCoordinator.dismissCallback = { value in
			#expect(value == true)
			numberOfCalls += 1
		}

		let sut = FirstViewModel(coordinator: mockedCoordinator)

		sut.didTapButton()
		sut.didTapBack()

		#expect(numberOfCalls == 2)
    }

}

private struct CoordingatorMock: cenas {

	var goToDetailViewCallback: ((Bool) -> Void)?
	var dismissCallback: ((Bool) -> Void)?

	func goToDetailView() {

		guard let goToDetailViewCallback else { return }

		goToDetailViewCallback(true)
	}
	
	func dismiss() {

		guard let dismissCallback else { return }

		dismissCallback(true)
	}
}
