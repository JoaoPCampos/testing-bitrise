//
//  ListView.swift
//  TestCordin
//
//  Created by João Campos on 04/11/2024.
//

import SwiftUI

struct ListView: View {

	private let items: [String] = ["Item 1", "Item 2"]

    var body: some View {
		List {
			ForEach(items, id: \.self) {
				Text($0)
			}
		}
    }
}

#Preview {
    ListView()
}
