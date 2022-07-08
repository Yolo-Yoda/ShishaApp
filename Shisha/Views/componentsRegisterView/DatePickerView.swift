//
//  DatePickerView.swift
//  ShishaApp
//
//  Created by Виктор Васильков on 3.07.22.
//

import SwiftUI

struct DatePickerView: View {
    @State private var birthDate = Date()
    var body: some View {
        DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
            Text("Select a date")
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
