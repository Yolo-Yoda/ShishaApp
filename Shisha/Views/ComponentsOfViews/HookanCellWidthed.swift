import SwiftUI

struct HookanCellWidthed: View {
    
    var hoohkan: Hookahn.HookahnData
    
    var body: some View {
        VStack {
            VStack {
                Image("hookah")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 100, alignment: .leading)
                    .cornerRadius(25)
                    .clipped()
                HStack {
                    HStack {
                        Text(hoohkan.name ?? "error")
                            .lineLimit(0)
                            .font(.title3)
                            .foregroundColor(Color.black)
                    }
                    .padding(.top,-40)
                    .frame(alignment: .leading)
                }
            }
            .padding(.bottom, -10)
            .frame(width: screen.width * 0.8)
            .background(Color.white)
            .cornerRadius(25)
            .shadow(color: Color.indigo, radius: 5, x: 0, y: 0)
        }.padding(.horizontal, 10)
    }
}

struct HookanCell2_Previews: PreviewProvider {
    static var previews: some View {
        HookanCellWidthed(hoohkan: Hookahn.HookahnData(id: 1, active: false, name: "1", imageURL: "2", body: "3", bodyShort: "4"))
    }
}

//AsyncImage(url: URL(string: hoohkan.imageURL ?? "1")) { image in
//    image
//        .resizable()
//        .aspectRatio(contentMode: .fill)
//        .frame(height: 100, alignment: .leading)
//        .cornerRadius(25)
//        .clipped()
//} placeholder: {
//    ProgressView()
//        .frame(height: 100, alignment: .leading)
//}
