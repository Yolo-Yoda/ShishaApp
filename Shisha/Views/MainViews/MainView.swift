import SwiftUI

struct MainView: View {
    
    @AppStorage("selectedTab") var selectedTab: Tab = .hoohkan
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .hoohkan:
                NavigationView {
                    HoohkahnView()
                }
            case .tabaco:
                NavigationView {
                    TabacoView()
                }
            case .miks:
                NavigationView {
                    MiksView()
                }
            case .user:
                NavigationView {
                    ProfileView()
                }
            }
            
            TapBar()
        }
        .background(.ultraThinMaterial)
        .background(Image("BackgroungHookahn")
                        .aspectRatio(contentMode: .fit))
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
