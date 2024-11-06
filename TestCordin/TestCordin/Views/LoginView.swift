//
//  LoginView.swift
//  TestCordin
//
//  Created by João Campos on 31/10/2024.
//

import SwiftUI

struct LoginView: View {
	
	@State private var username: String = ""
	@State private var password: String = ""
	@State private var isSecure: Bool = true

	var body: some View {
		VStack {
			Button(action: {

			}) {
				Text("Login")
					.foregroundColor(.white)
					.padding()
					.frame(maxWidth: .infinity)
					.background(Color.blue)
					.cornerRadius(10)
					.padding(.horizontal, 30)
			}
			.padding(.top, 30)

			Spacer()

			VStack {
				Button(action: {
				}) {
					Text("Forgot Password?")
						.foregroundColor(.blue)
				}
				.padding(.bottom, 10)

				HStack {
					Text("Don't have an account?")
					Button(action: {
					}) {
						Text("Sign Up")
							.foregroundColor(.blue)
					}
				}
				.padding(.bottom, 20)
			}
		}
		.background(Color(.systemGroupedBackground))
		.edgesIgnoringSafeArea(.all)
	}
}
