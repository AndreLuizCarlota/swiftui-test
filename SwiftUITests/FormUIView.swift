//
//  FormUIView.swift
//  SwiftUITests
//
//  Created by Andre Luiz Carlota on 1/17/23.
//

import SwiftUI

struct User {
    var name: String = "Andre"
}

struct FormUIView: View {
    @State private var user = User()

    @State private var pickerAge = 18
    @State private var textField = 0.0
    @State private var textFieldLastName = ""

    private var amount: Double {
        let field = Double(textField)
        let age = Double(pickerAge)
        return field * age
    };

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text(user.name)
                    TextField("Name:", value: $textField, formatter: formatter).keyboardType(.decimalPad)
                    Picker("Tip your age", selection: $pickerAge) {
                        ForEach(18...60, id: \.self) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Main")
                }

                Section {
                    TextField("Last Name:", text: $textFieldLastName)
                    Text("\(amount)")
                } header: {
                    Text("Infos")
                }

            }
        }
    }
}

struct FormUIView_Previews: PreviewProvider {
    static var previews: some View {
        FormUIView()
    }
}
