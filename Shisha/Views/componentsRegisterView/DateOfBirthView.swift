//
//  DateOfBirthView.swift
//  ShishaApp
//
//  Created by Виктор Васильков on 3.07.22.
//

import SwiftUI

struct DateOfBirthView: View {
    
    @State private var birthDate = Date()
    
    var body: some View {
        VStack{
            HStack{
                //ЗАМЕНА КАРТИНКИ
                Image(systemName: "star.fill")
                    .foregroundColor(Color("Violent"))
                    .frame(width: 13.5, height: 13.5)
                DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                    Text("Дата рождения")
                        .font(.custom("FuturaPT-Book",size: 13))
                        .foregroundColor(Color("Violent"))
                        .padding(.horizontal, 6)
                }.frame(height: 25)

            }
            Label("", image: "")
                .frame(width: 280, height: 2)
                .background(Color("Gray224"))
        }
        .frame(width: 280, height: 40)
    }
}

struct DateOfBirthView_Previews: PreviewProvider {
    static var previews: some View {
        DateOfBirthView()
    }
}
