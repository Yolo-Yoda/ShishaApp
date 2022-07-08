import SwiftUI

struct TabacoCell: View {
    
    @State private var buttonEntered: Bool = true
    
    var tabaco: Tabaco.TabacoData
 
    var body: some View {
        
        VStack {
            Image("hookah")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screen.width * 0.43 - 20)
                .cornerRadius(25)
                .clipped()
                .padding(.top, 10)
            Text(tabaco.name ?? "error")
                .font(.custom("FuturaPT-Book",size: 15))
                .foregroundColor(Color.black)
                .frame(width: screen.width * 0.43 - 20, alignment: .leading)
                .padding(.top, 20)
                .padding(.leading, 40)
                .padding(.trailing, 20)
                .padding(.bottom, 20)

            Button(action: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    buttonEntered.toggle()
                }
                buttonEntered.toggle()
            }, label: {
                if tabaco.active != true {
                    HStack {
                        Text("Нет в наличии")
                            .font(.custom("FuturaPT-Book",size: 15))
                            .foregroundColor( Color("Gray158"))
                    }
                    .frame(width: screen.width * 0.43 - 20, height: 41)
                    .background(Color("Gray245"))
                    .cornerRadius(50)
                } else {
                    HStack {
                        Text("В корзину")
                            .font(.custom("FuturaPT-Book",size: 15))
                            .foregroundColor(buttonEntered ? Color.white : Color("Violent"))
                    }
                    .frame(width: screen.width * 0.43 - 20, height: 41)
                    .background(buttonEntered ?Color("Violent") : Color("MainColor"))
                    .cornerRadius(50)
                }
                
            })
                .padding(.bottom, 10)
                .background(Color("White"))
                .shadow(color: tabaco.active ? Color("shadowCell") : Color("Gray"), radius: 5, x: 0, y: 0)
        }
        .frame(width: screen.width * 0.43)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color("shadowCell"), radius: 5, x: 0, y: 0)  
    }
}

struct TabacoCell_Previews: PreviewProvider {
    static var previews: some View {
        TabacoCell(tabaco: Tabaco.TabacoData(id: 1, active: true, name: "1", body: "3", bodyShort: "4"))
    }
}
