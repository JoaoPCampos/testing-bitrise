//
//  TestCordinApp.swift
//  TestCordin
//
//  Created by João Campos on 31/10/2024.
//

import SwiftUI

@main
struct TestCordinApp: App {

	var body: some Scene {
        
		WindowGroup {

			TabView {

				WalkthroughView(vm: WalkthroughViewModel())
				.tabItem {
					Label("Walkthrough", systemImage: "triangle.circle.fill")
				}

				ListView()
					.tabItem {
						Label("Games", systemImage: "list.dash")
					}
			}
        }
    }
}
