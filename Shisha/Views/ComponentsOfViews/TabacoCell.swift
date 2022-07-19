import SwiftUI

struct TabacoCell: View {
    
    var tabaco: Tabaco.TabacoData
    
    @State private var buttonEntered: Bool = true
    
    @ObservedObject var authModel: AuthViewModel = AuthViewModel.shared
 
    var body: some View {
        VStack {
            Image("hookah")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screen.width * 0.43 - 20)
                .cornerRadius(25)
                .clipped()
                .padding(.top, 10)
            Image(systemName: "checkmark.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .offset(x: 50, y: -150)
                .foregroundColor(proverka(CartTabaco(tabaco: tabaco)) ? Color.black.opacity(1) : Color.black.opacity(0))
                .background(
                    Circle()
                        .frame(width: 40, height: 40)
                        .offset(x: 50, y: -150)
                        .foregroundColor(proverka(CartTabaco(tabaco: tabaco)) ? Color.indigo.opacity(1) : Color.indigo.opacity(0)))
            Text(tabaco.name ?? "error")
                .font(.custom("FuturaPT-Book",size: 15))
                .foregroundColor(Color.black)
                .frame(width: screen.width * 0.43 - 20, alignment: .center)
                .padding(.top, -50)
                .padding(.vertical, 10)
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
                .padding(.top, -20)
                .padding(.bottom, 10)
                .background(Color("White"))
                .shadow(color: tabaco.active ? Color("shadowCell") : Color("Gray"), radius: 5, x: 0, y: 0)
        }
        .frame(width: screen.width * 0.43)
        .background(.ultraThinMaterial)
        .cornerRadius(25)
        .shadow(color: Color("shadowCell"), radius: 5, x: 0, y: 0)
    }
    
    func proverka(_ tabaco: CartTabaco) -> Bool {
        if authModel.ownTabacos.contains(tabaco){
            return true
        } else {
            return false
        }
    }
}

struct TabacoCell_Previews: PreviewProvider {
    static var previews: some View {
        TabacoCell(tabaco: Tabaco.TabacoData(id: 1, active: true, name: "табак", body: "3", bodyShort: "4"))
    }
}
