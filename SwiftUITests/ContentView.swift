//
//  ContentView.swift
//  SwiftUITests
//
//  Created by Andre Luiz Carlota on 12/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @State private var sheetPresent = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Apenas título da pagina")
                    .navigationTitle("Pagina 1")
                    .hidden()

                Button("Alert", role: .cancel) {
                    showAlert = true
                }
                .padding([.top], 20)
                .alert("Title Alert", isPresented: $showAlert) {
                    Button("Destructive", role: .destructive) { }
                    Button("Cancel", role: .cancel) { }
                    Button("Done", role: .none) { }
                }.padding()

                Button("Modal Sheet", role: .cancel) {
                    sheetPresent = true
                }.sheet(isPresented: $sheetPresent) {
                    FormUIView()
                }.padding()

                NavigationLink {
                    AnimationsUIView()
                } label: {
                    Text("Push Navigation")
                }
                .padding()

                NavigationLink {
                    ShapesUIView()
                } label: {
                    Text("Shapes")
                }
                .padding()

                NavigationLink {
                    ColorCyclingUIView()
                } label: {
                    Text("High Performance GPU")
                }
                .padding()

                NavigationLink {
                    SpirographView()
                } label: {
                    Text("Spirograph")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
