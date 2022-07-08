import SwiftUI
import Combine

struct MainView: View {
    
    
    
    @State private var searchQuery: String = ""
    
    var body: some View {
        TabView {
            NavigationView {
                HoohkahnView()
                    .searchable(text: $searchQuery, placement: .navigationBarDrawer)
            }
                .tabItem {
                    VStack{
                        Image(systemName: "lasso")
                        Text("Кальяны")
                    }
                }
            
            NavigationView {
                TabacoView()
                    .searchable(text: $searchQuery, placement: .navigationBarDrawer)
            }
                .tabItem {
                    VStack{
                        Image(systemName: "person.circle")
                        Text("Табаки")
                    }
                }
            NavigationView {
                MiksView()
                    .searchable(text: $searchQuery, placement: .navigationBarDrawer)
            }
                .tabItem {
                    VStack{
                        Image(systemName: "person.circle")
                        Text("Миксы")
                        
                    }
                }
            ProfileView()
                .tabItem {
                    VStack{
                        Image(systemName: "person.circle")
                        Text("Пользователь")
                    }
                }
        }
        .ignoresSafeArea()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
