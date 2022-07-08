import SwiftUI

struct HookanDetailView: View {
    
    var hoohkan: Hookahn.HookahnData
    
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
                
                Text(hoohkan.name ?? "1")
                    .font(.custom("FuturaPT-Book",size: 25))
                    .foregroundColor(Color.black)
                    .frame(width: screen.width-50, alignment: .leading)
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
                Text(hoohkan.body ?? "2")
                    .font(.custom("FuturaPT-Book",size: 16))
                    .foregroundColor(Color.black)
                    .frame(width: screen.width-50, alignment: .leading)
                    .padding(.top, 10)
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
                    .padding(.bottom, 100)
                
            }
        }.ignoresSafeArea()
        
    }
}

struct HookanDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HookanDetailView(hoohkan: Hookahn.HookahnData(id: 1, active: false, name: "1", imageURL: "2", body: "3", bodyShort: "4"))
            HookanDetailView(hoohkan: Hookahn.HookahnData(id: 1, active: false, name: "1", imageURL: "2", body: "3", bodyShort: "4"))
        }
    }
}
