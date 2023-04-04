//
//  View+Extensions.swift
//  SwiftUITests
//
//  Created by Andre Luiz Carlota on 1/17/23.
//

import SwiftUI

extension View {
    func Grid<Content: View>(row: Int, column: Int, content: @escaping (Int, Int) -> Content) -> some View {
        GridStack<Content>(row: row, column: column, content: content)
    }
}
