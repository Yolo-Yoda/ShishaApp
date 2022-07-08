//
//  SecondPasswordFillVIew.swift
//  ShishaApp
//
//  Created by Виктор Васильков on 3.07.22.
//

import SwiftUI

struct SecondPasswordFillVIew: View {
    
    @State private var secondPassword = ""
    
    var body: some View {
        VStack{
            HStack{
                //ЗАМЕНА КАРТИНКИ
                Image(systemName: "star.fill")
                    .foregroundColor(Color("Violent"))
                    .frame(width: 13.5, height: 13.5)
                SecureField("Повторите пароль", text: $secondPassword)
                    .font(.custom("FuturaPT-Book",size: 13))
                    .foregroundColor(Color("Gray"))
                    .padding(.horizontal, 6)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("Gray213"))
                        .frame(width: 13.5, height: 13.5)
                })
            }
            
            Label("", image: "")
                .frame(width: 280, height: 2)
                .background(Color("Gray224"))
        }.frame(width: 280, height: 40)
    }
}

struct SecondPasswordFillVIew_Previews: PreviewProvider {
    static var previews: some View {
        SecondPasswordFillVIew()
    }
}
