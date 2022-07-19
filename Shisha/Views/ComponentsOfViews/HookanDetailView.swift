import SwiftUI

struct HookanDetailView: View {
    
    var hoohkan: Hookahn.HookahnData
    
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
            }.frame(width: 350)
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitleDisplayMode(.inline)
        .background(.thinMaterial)
        .background(Image("BackgroungHookahn")
                        .aspectRatio(contentMode: .fit))
    }
}

struct HookanDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HookanDetailView(hoohkan: Hookahn.HookahnData(id: 1, active: false, name: "1", imageURL: "2", body: "3", bodyShort: "4"))
        }
    }
}
