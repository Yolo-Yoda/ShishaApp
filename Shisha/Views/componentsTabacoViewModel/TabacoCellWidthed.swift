import SwiftUI

struct TabacoCellWidthed: View {
    
    var tabaco: Tabaco.TabacoData
    
    var body: some View {
        VStack {
            Image("hookah")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 100, alignment: .leading)
                .cornerRadius(25)
                .clipped()
            HStack {
                Text(tabaco.name ?? "error")
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

struct TabacoCellWidthed_Previews: PreviewProvider {
    static var previews: some View {
        TabacoCellWidthed(tabaco: Tabaco.TabacoData(id: 1, active: true, name: "1", body: "3", bodyShort: "4"))
    }
}
