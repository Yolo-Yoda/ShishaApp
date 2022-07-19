import SwiftUI

struct TapBar: View {
    
    @AppStorage("selectedTab") var selectedTab: Tab = .hoohkan
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                content
            }
            .padding()
            .background(Color("Violet").opacity(0.4))
            .background(.ultraThinMaterial)
            .background(
                HStack {
                    if selectedTab == .user { Spacer() }
                    if selectedTab == .tabaco { Spacer() }
                    if selectedTab == .miks {
                        Spacer()
                        Spacer()
                    }
                    Circle().fill(Color.indigo).frame(width: 100)
                    if selectedTab == .hoohkan { Spacer() }
                    if selectedTab == .tabaco {
                        Spacer()
                        Spacer()
                    }
                    if selectedTab == .miks { Spacer() }
                }
                    .padding(.horizontal, 12)
            )
            .mask(RoundedRectangle(cornerRadius: 24, style: .continuous))
            
            .shadow(color: Color("Violet").opacity(1), radius: 20, x: 0, y: 10)
            .overlay(RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(.linearGradient(colors: [.white.opacity(0.3), .white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing)))
            .padding(.horizontal, 24)
        }
    }
    
    var content: some View {
        ForEach(tabItems) { item in
            Spacer()
            Button {
                withAnimation {
                    selectedTab = item.tapped
                }
            } label: {
                Image(systemName: item.icon)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(10)
                    .foregroundColor(Color.white)
                    .opacity(selectedTab == item.tapped ? 1: 0.4)
                    .background(
                        VStack {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(Color.white)
                                .frame(width: selectedTab == item.tapped ? 30: 0,height: 4)
                                .frame(maxHeight: .infinity,alignment: .top)
                                .offset(y: -5)
                                .opacity(selectedTab == item.tapped ? 1: 0)
                        }
                    )
            }
            Spacer()
        }
    }
    
    
}

struct TapBar_Previews: PreviewProvider {
    static var previews: some View {
        TapBar()
    }
}

