import SwiftUI

struct ProfileView: View {
    
    let phoneNumber = "tel://+375259614644"
    let telegram = "https://t.me/@YolooYoda"
    
    @ObservedObject var authModel: AuthViewModel = AuthViewModel.shared
    
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack() {
                HStack {
                    Image("Yoda")
                        .resizable()
                        .cornerRadius(100)
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing, 25)
                    VStack(alignment: .leading) {
                        Text("Hello,")
                            .font(.title)
                        Text("\(AuthViewModel.shared.user)")
                            .font(.title2)
                    }
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                List {
                    Section("Мои табаки :") {
                        ForEach(authModel.ownTabacos, id: \.self) { cartBeer in
                            NavigationLink {
                                let a: Tabaco.TabacoData = cartBeer.tabaco
                                TabacoDetailView(tabaco: a)
                                
                            } label: {
                                BasketCell(cartTabaco: cartBeer)
                                
                            }
                        }.onDelete { indexSet in
                            authModel.ownTabacos.remove(atOffsets: indexSet)
                        }
                    }
                    Section("Доступные мне миксы :") {
                        ForEach(MiksViewModel.shared.mikses.filter({ miks in
                            var bool: Bool = false
                            for tabac in miks.comprises {
                                let tabaco = CartTabaco(tabaco: tabac)
                                if authModel.ownTabacos.contains(tabaco) {
                                    bool = true
                                } else {
                                    bool = false
                                }
                            }
                            return bool

                        }), id: \.self) { miks in
                            NavigationLink {
                                MiksDetailView(miks: miks)
                            } label: {
                                MiksCell2(miks: miks)
                                  
                            }
                        }
                    }
                   
                    
                }
                .foregroundColor(Color.black)
                .background(Color.clear)
                .listStyle(.plain)
                
                Spacer()
                HStack {
                    Link(destination: URL(string: "\(telegram)")!) {
                        Image(systemName: "paperplane")
                            .foregroundColor(Color.black)
                        Text("Напишите нам")
                            .font(.footnote)
                            .foregroundColor(Color.black)
                    }
                    .background {
                        Rectangle()
                            .foregroundColor(Color.clear)
                            .frame(width: 170, height: 50)
                            .buttonBorderShape(.capsule)
                            .border(Color.black, width: 3)
                    }.padding(.horizontal, 20)
                    
                    Spacer()
                    Link(destination: URL(string: "\(phoneNumber)")!) {
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color.black)
                        Text("Позвоните нам")
                            .font(.footnote)
                            .foregroundColor(Color.black)
                    }
                    .background {
                        Rectangle()
                            .foregroundColor(Color.clear)
                            .frame(width: 170, height: 50)
                            .buttonBorderShape(.capsule)
                            .border(Color.black, width: 3)
                    }
                    .padding(.vertical, 40)
                    .padding(.horizontal, 20)
                    
                
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 80)
                
            }
            
            .background(.ultraThinMaterial)
            .background(Image("BackgroungHookahn")
                            .aspectRatio(contentMode: .fit))
            .navigationBarHidden(true)
            
        }
    }

}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(authModel: AuthViewModel.shared)
    }
}


struct BasketCell: View {
    
    let cartTabaco: CartTabaco
    
    var body: some View {
        HStack {
            Text(cartTabaco.tabaco.name ?? "1")
            
            Spacer()
            
        }
        .padding(.horizontal)
    }
}
struct MiksCell2: View {
    
    let miks: MiksData
    
    var body: some View {
        HStack {
            Text(miks.name)
            
            Spacer()
            
        }.padding(.horizontal)
    }
}
