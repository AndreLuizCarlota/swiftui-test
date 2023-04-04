//
//  AnimationsUIView.swift
//  SwiftUITests
//
//  Created by Andre Luiz Carlota on 1/17/23.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let row: Int
    let column: Int

    @ViewBuilder let content: (Int, Int) -> Content

    var body: some View {
        VStack(spacing: 20) {
            ForEach(0...row, id: \.self) { row in
                HStack {
                    ForEach(0...column, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct AnimationsUIView: View {
    // Animations Drag
    @State private var size = 100.0
    @State private var point: CGSize = .zero
    @State private var pointH: CGSize = .zero
    @State private var hello = "Hello World"

    // Animation Rotation
    @State private var buttons = [(Int, Bool)](repeating: (1, false), count: 5)
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Apenas título da pagina")
                    .hidden()
                    .navigationTitle("Animations")

                HStack(spacing: 10) {
                    ForEach(0 ..< hello.count, id: \.self) {
                        Text("\($0)")
                            .frame(width: 20, height: 20)
                            .background(.red)
                            .offset(pointH)
                            .animation(.default.delay(Double($0) / 10), value: pointH)
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged { ani in
                            pointH = ani.translation
                        }.onEnded { _ in
                            withAnimation(.easeIn) {
                                pointH = .zero
                            }
                        }
                ).padding()

                LinearGradient(colors: [.red, .blue], startPoint: .top, endPoint: .bottom)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: size, height: size)
                    .offset(point)
                    .gesture(
                        DragGesture()
                            .onChanged {
                                withAnimation(.linear) {
                                    if size == 100 {
                                        size += 10
                                    }
                                }

                                point = $0.translation
                            }.onEnded { _ in
                                withAnimation {
                                    point = .zero
                                }

                                size = 100
                            }
                    )
                    .padding([.bottom])

                Grid(row: 4, column: 4) { row, column in
                    buildButton(row, column)
                }
            }
        }
    }

    private func buildButton(_ row: Int, _ column: Int) -> some View {
        let button = Button("\(row) - \(column)")
        {
            withAnimation(.easeIn(duration: 0.5)) {
                buttons[column].1.toggle()
            }
        }
        .foregroundColor(.white)
        .frame(width: 60, height: 60)
        .background(buttons[column].1 ? .red : .blue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .rotation3DEffect(buttons[column].1 ? Angle(degrees: 180) : Angle(degrees: 0), axis: (x: 0, y: 1, z: 0))

        return button
    }
}

struct AnimationsUIView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsUIView()
    }
}
