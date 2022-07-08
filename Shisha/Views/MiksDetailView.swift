import SwiftUI

struct MiksDetailView: View {
    
    var miks: MiksData
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .leading) {
                    Image(miks.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                        .frame(width: screen.width-100, height: screen.width-100)
                        .cornerRadius(50)
                }.shadow(color: Color("shadowCell"), radius: 50, x: 0, y: 0)
                Text("\(miks.name) \(miks.count)")
                    .font(.custom("FuturaPT-Book",size: 25))
                    .foregroundColor(Color("MiksText"))
                    .frame(width: screen.width-50, alignment: .leading)
                    
                Text(miks.bodyShort)
                    .font(.custom("Montserrat",size: 13))
                    .foregroundColor(Color.black)
                    .frame(width: screen.width-50, alignment: .leading)
                    .padding(.top, 10)
                    
            }
        }
    }
}

struct MiksDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MiksDetailView(miks: MiksData(id: 1,
                                        active: true,
                                        name: "Adalya - Jungle Jungle (Лимон, Лайм, Грейпфрут, Апельсин)",
                                        bodyShort: "Приятный сливочный вкус в тандеме с личи даёт поистине неповторимый вкус. Самое то что бы вам скорее расслабиться после тяжелого трудового дня.",
                                        imageURL: "3image",
                                        count: "50 гр"))
    }
}
