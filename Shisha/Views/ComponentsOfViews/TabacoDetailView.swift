import SwiftUI

struct TabacoDetailView: View {
    
    var tabaco: Tabaco.TabacoData
    
    @State private var buttonBuying: Bool = false
    
    @ObservedObject var authModel: AuthViewModel = AuthViewModel.shared
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                VStack {
                    if geometry.frame(in: .global).minY <= 0 {
                        Image("hookah")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .offset(y: geometry.frame(in: .global).minY/9)
                            .clipped()
                    } else {
                        Image("hookah")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                            .clipped()
                            .offset(y: -geometry.frame(in: .global).minY)
                    }
                }
                .shadow(color: Color("shadowCell"), radius: 20, x: 0, y: 0)
            }.frame(height: 400)
            
            VStack(alignment: .leading) {
                Text(tabaco.name ?? "error")
                    .font(.custom("FuturaPT-Book",size: 25))
                    .foregroundColor(Color.black)
                Text(tabaco.body ?? "error")
                    .font(.custom("FuturaPT-Book",size: 18))
                    .lineLimit(nil)
                    .foregroundColor(Color.black)
                    .frame(alignment: .leading)
                .padding(.vertical, 20)
                Button {
                    buttonBuying.toggle()
                    AuthViewModel.shared.appendTabaco(CartTabaco(tabaco: tabaco))
                } label: {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .foregroundColor(proverka(CartTabaco(tabaco: tabaco)) ? Color.gray.opacity(0.7) : Color.indigo.opacity(0.7))
                            .cornerRadius(20)
                            .buttonStyle(.borderless)
                        Text(proverka(CartTabaco(tabaco: tabaco)) ? "Уже добавлено" : "Добавить к себе")
                            .font(.custom("FuturaPT-Book",size: 20))
                            .foregroundColor(Color.black)
                    }
                }.frame(width: 200, height: 40, alignment: .trailing)
                    .padding(.bottom, 100)
            }
            .disabled(proverka(CartTabaco(tabaco: tabaco)))
            .frame(width: 350)
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitleDisplayMode(.inline)
        .background(.thinMaterial)
        .background(Image("BackgroungHookahn")
                        .aspectRatio(contentMode: .fit))
    }
    func proverka(_ tabaco: CartTabaco) -> Bool {
        if authModel.ownTabacos.contains(tabaco){
            return true
        } else {
            return false
        }
    }
}

struct TabacoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TabacoDetailView(tabaco: Tabaco.TabacoData(id: 1, active: true, name: "1", body: "333333333\n3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333", bodyShort: "4"))
    }
}

