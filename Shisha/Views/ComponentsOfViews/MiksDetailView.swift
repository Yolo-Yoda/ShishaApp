import SwiftUI

struct MiksDetailView: View {
    
    var miks: MiksData
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .leading) {
                    Image(miks.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screen.width-100, height: screen.width-100)
                        .cornerRadius(50)
                }.shadow(color: Color("shadowCell"), radius: 50, x: 0, y: 0)
                Text("\(miks.name) \(miks.count)")
                    .font(.custom("FuturaPT-Book",size: 25))
                    .foregroundColor(Color.black)
                    .frame(width: screen.width-50, alignment: .leading)
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text("Состав микса: ")
                            .font(.custom("Montserrat",size: 13))
                        VStack(alignment: .leading, spacing: 10) {
                            
                            ForEach(miks.comprises) { compire in
                                Text(compire.name ?? "1")
                                    .font(.custom("Montserrat",size: 13))
                            }
                        }
                        Spacer()
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                    
                Text(miks.bodyShort)
                    .font(.custom("Montserrat",size: 13))
                    .foregroundColor(Color.black)
                    .frame(width: screen.width-50, alignment: .leading)
                    .padding(.top, 10)
                    
            }
        }.navigationBarTitleDisplayMode(.inline)
            .background(.thinMaterial)
            .background(Image("BackgroungHookahn")
                            .aspectRatio(contentMode: .fit))
    }
}

struct MiksDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MiksDetailView(miks: MiksData(id: 1,
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
