//
//  RegisterButtonView.swift
//  ShishaApp
//
//  Created by Виктор Васильков on 3.07.22.
//

import SwiftUI

struct RegisterButtonView: View {
    var body: some View {
        VStack {
            Button(action: {
                //GO TO APP
            }, label: {
                Text("Зарегистрироваться")
                    .font(.custom("FuturaPT-Book",size: 20))
                    .foregroundColor(Color.white)
            })
                .frame(width: 281, height: 45)
                .background(Color("Violent"))
                .cornerRadius(36)
        }
    }
}

struct RegisterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterButtonView()
    }
}
