//
//  MiksCell.swift
//  Shisha
//
//  Created by Виктор Васильков on 8.07.22.
//

import SwiftUI

struct MiksCell: View {
    var miks: MiksData
    var body: some View {
        VStack {
            Image(miks.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screen.width * 0.43)
                .cornerRadius(25)
                .clipped()
                .padding(.top, 10)
            Label("", image: "")
                .frame(width: screen.width * 0.43-30, height: 2)
                .background(Color("Arounding"))
            Text("\(miks.name) \(miks.count)")
            
                .font(.custom("FuturaPT-Book",size: 10))
                .foregroundColor(Color.black)
                .frame(width: screen.width * 0.43 - 30, alignment: .leading)
//                .padding(.leading, 40)
//                .padding(.trailing, 20)
                .padding(.bottom, 20)
        }
        .frame(width: screen.width * 0.43)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color("shadowCell"), radius: 5, x: 0, y: 0)
    }
}

struct MiksCell_Previews: PreviewProvider {
    static var previews: some View {
        MiksCell(miks: MiksData(id: 1,
                                active: true,
                                name: "Adalya - Jungle Jungle (Лимон, Лайм, Грейпфрут, Апельсин)",
                                bodyShort: "Приятный сливочный вкус в тандеме с личи даёт поистине неповторимый вкус. Самое то что бы вам скорее расслабиться после тяжелого трудового дня.",
                                imageURL: "3image",
                                count: "50 гр"))
    }
}
