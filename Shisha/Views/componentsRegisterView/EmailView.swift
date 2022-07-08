//
//  EmailView.swift
//  ShishaApp
//
//  Created by Виктор Васильков on 3.07.22.
//

import SwiftUI

struct EmailView: View {
    
    @State private var email = ""
    
    var body: some View {
        VStack{
            HStack{
                //ЗАМЕНА КАРТИНКИ
                Image(systemName: "star.fill")
                    .foregroundColor(Color("Violent"))
                    .frame(width: 13.5, height: 13.5)
                TextField("E-mail", text: $email)
                    .font(.custom("FuturaPT-Book",size: 13))
                    .foregroundColor(Color("Gray"))
                    .padding(.horizontal, 6)
            }
            Label("", image: "")
                .frame(width: 280, height: 2)
                .background(Color("Gray224"))
        }
        .frame(width: 280, height: 40)
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
    }
}
