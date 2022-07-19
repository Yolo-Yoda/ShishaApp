import SwiftUI

struct MiksCell: View {
    
    var miks: MiksData
    
    @ObservedObject var authModel: AuthViewModel = AuthViewModel.shared
    
    var body: some View {
        VStack {
            Image(miks.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screen.width * 0.43)
                .cornerRadius(25)
                .clipped()
                .padding(.top, 10)
            Image(systemName: "checkmark.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .offset(x: 50, y: -170)
                .foregroundColor(proverka() ? Color.black.opacity(1) : Color.black.opacity(0))
                .background(
                    Circle()
                        .frame(width: 40, height: 40)
                        .offset(x: 50, y: -170)
                        .foregroundColor(proverka() ? Color.indigo.opacity(1) : Color.indigo.opacity(0)))
            Label("", image: "")
                .frame(width: screen.width * 0.43-30, height: 2)
                .background(Color("Arounding"))
                .padding(.top, -60)
            VStack (alignment: .leading) {
                Text("\(miks.name) \(miks.count)")
                    .font(.custom("FuturaPT-Book",size: 10))
                    .foregroundColor(Color.black)
                    .padding(.horizontal, 15)
                    .padding(.bottom, 20)
                    .padding(.top, -50)
            }
        }
        .frame(width: screen.width * 0.43)
        .background(.ultraThinMaterial)
        .cornerRadius(25)
        .shadow(color: Color("shadowCell"), radius: 5, x: 0, y: 0)
    }
    
    func proverka() -> Bool {
        var bool: Bool = false
        for tabac in miks.comprises {
            if authModel.ownTabacos.contains(CartTabaco(tabaco: tabac)) {
                bool = true
            } else {
                bool = false
            }
        }
        return bool

    }
  
}

struct MiksCell_Previews: PreviewProvider {
    static var previews: some View {
        MiksCell(miks: MiksData(id: 1,
                                active: true,
                                name: "Adalya - Jungle Jungle (Лимон, Лайм, Грейпфрут, Апельсин)",
                                bodyShort: "Приятный сливочный вкус в тандеме с личи даёт поистине неповторимый вкус. Самое то что бы вам скорее расслабиться после тяжелого трудового дня.",
                                imageURL: "3image",
                                count: "50 гр",
                                comprises: [Tabaco.TabacoData(id: 1,
                                                              active: false,
                                                              name: "Sed natus ut modi sunt quas.",
                                                              body: "Dicta consectetur repellendus nobis commodi. Quia enim necessitatibus aliquid earum natus sit beatae. Officiis voluptatem et vitae. Debitis necessitatibus sit deleniti non magnam aut sunt omnis.\n\nQui nisi consequatur illo minima praesentium. Nihil possimus illo magnam aut. Saepe impedit voluptas rem. Excepturi cum facilis dicta.\n\nModi nihil praesentium repellendus. Est ipsa recusandae dolores ex omnis saepe nam velit. Porro et possimus alias esse sed odit tempora in. Suscipit explicabo labore vitae porro voluptatem suscipit.\n\nEt dolores placeat ut eum rerum reprehenderit sequi explicabo. Sequi porro et error. Nam ut ea voluptatem officia deleniti necessitatibus aut.\n\nRem architecto et repudiandae consequatur itaque ab. Enim quod sed non excepturi. Non eligendi ut tempore quas perferendis illo qui. Expedita non qui maiores unde at ratione blanditiis.\n\nVitae reiciendis quia totam soluta qui delectus corporis. Iure voluptas illum occaecati deserunt debitis ut. Tenetur aut officia suscipit laboriosam velit id.\n\nEt commodi odit ea aut quisquam ea cum. Sunt culpa temporibus temporibus optio sint sed. Facere ullam id tenetur qui nemo nulla quibusdam.\n\nEt aliquam error et in. Et dolorem soluta enim accusamus. Rerum sunt corrupti consequatur rerum maxime excepturi. Et expedita necessitatibus harum qui natus. Eveniet animi et fuga rerum animi animi et similique.",
                                                              bodyShort: nil),
                                            Tabaco.TabacoData(id: 3,
                                                              active: false,
                                                              name: "Eius neque omnis nulla.",
                                                              body: "Ut minima dolor amet non magnam. Est eaque ut sint ea vitae magnam. Non earum recusandae et rerum cumque labore.\n\nEt repellat dolor laborum sunt voluptatem sit libero. Non saepe similique quia amet iste et. Ea sit sapiente dolor dicta sed eius.\n\nMaxime enim porro non. Animi ut quibusdam modi a saepe. Omnis nihil quia eum commodi blanditiis vel dicta officia. Vel vitae quasi animi voluptate voluptatem consequatur sint quia.\n\nCorporis est sint sint dolores ipsa. Veritatis inventore dolores beatae ad suscipit ex. Ullam veritatis dolor qui.\n\nEius labore magnam nostrum quo numquam aut et. Odit perspiciatis cupiditate harum dolorum. Et rerum aliquam neque et velit. Distinctio non nihil et autem. Nihil soluta non ipsa alias architecto consequatur.\n\nUt qui deserunt dolor non perferendis. Molestiae at impedit aperiam id laudantium. Suscipit voluptas quia est omnis.\n\nSaepe et nulla doloremque explicabo quas voluptatem. Dolore ipsa asperiores impedit ad. Rem qui repudiandae dignissimos sequi.\n\nEst asperiores quia corporis nihil ab distinctio qui. Unde debitis quis et. Non est voluptatem eveniet et est quod. Omnis culpa odio et maiores.",
                                                              bodyShort: nil)]))
    }
}
