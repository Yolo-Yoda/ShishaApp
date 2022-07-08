//
//  HookanCell2.swift
//  ShishaApp
//
//  Created by Виктор Васильков on 5.07.22.
//

import SwiftUI

struct HookanCellWidthed: View {
    
    var hoohkan: Hookahn.HookahnData
    
    var body: some View {
        VStack {
            Image("hookah")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 100, alignment: .leading)
                .cornerRadius(25)
                .clipped()
            HStack {
                Text(hoohkan.name ?? "error")
                    .lineLimit(0)
                    .font(.title2)
                    .foregroundColor(Color.black)
            }
            .padding(.top, -40)
            .frame(alignment: .leading)
        }
        .padding(.top, 5)
        .frame(width: screen.width * 0.8)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color("shadowCell"), radius: 1, x: 0, y: 0)
    }
}

struct HookanCell2_Previews: PreviewProvider {
    static var previews: some View {
        HookanCellWidthed(hoohkan: Hookahn.HookahnData(id: 1, active: false, name: "1", imageURL: "2", body: "3", bodyShort: "4"))
    }
}
