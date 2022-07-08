import SwiftUI

struct TabacoDetailView: View {
    
    var tabaco: Tabaco.TabacoData
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Image("hookah")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                        .frame(width: screen.width, height: screen.width)
                        .cornerRadius(50)
                        .shadow(color: Color("shadowCell"), radius: 5, x: 0, y: 0)
                }
                Text(tabaco.name ?? "error")
                    .font(.custom("FuturaPT-Book",size: 25))
                    .foregroundColor(Color.black)
                    .frame(width: screen.width-50, alignment: .leading)
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
                Text(tabaco.body ?? "error")
                    .font(.custom("FuturaPT-Book",size: 16))
                    .foregroundColor(Color.black)
                    .frame(width: screen.width-50, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.leading, 25)
                    .padding(.bottom, 100)
            }
        }.ignoresSafeArea()
        
    }
}

struct TabacoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TabacoDetailView(tabaco: Tabaco.TabacoData(id: 1, active: true, name: "1", body: "3", bodyShort: "4"))
    }
}
