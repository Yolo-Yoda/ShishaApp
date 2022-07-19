
import Foundation

class MiksViewModel: ObservableObject {
    
    static let shared = MiksViewModel()
    
    public init() { }
    
    var mikses = [MiksData(id: 1,
                           active: true,
                           name: "Adalya - Jungle Jungle (Лимон, Лайм, Грейпфрут, Апельсин)",
                           bodyShort: "Приятный сливочный вкус в тандеме с личи даёт поистине неповторимый вкус. Самое то что бы вам скорее расслабиться после тяжелого трудового дня.",
                           imageURL: "3image",
                           count: "50 гр", comprises: [Tabaco.TabacoData(id: 1,
                                                                         active: false,
                                                                         name: "Sed natus ut modi sunt quas.",
                                                                         body: "Dicta consectetur repellendus nobis commodi. Quia enim necessitatibus aliquid earum natus sit beatae. Officiis voluptatem et vitae. Debitis necessitatibus sit deleniti non magnam aut sunt omnis.\n\nQui nisi consequatur illo minima praesentium. Nihil possimus illo magnam aut. Saepe impedit voluptas rem. Excepturi cum facilis dicta.\n\nModi nihil praesentium repellendus. Est ipsa recusandae dolores ex omnis saepe nam velit. Porro et possimus alias esse sed odit tempora in. Suscipit explicabo labore vitae porro voluptatem suscipit.\n\nEt dolores placeat ut eum rerum reprehenderit sequi explicabo. Sequi porro et error. Nam ut ea voluptatem officia deleniti necessitatibus aut.\n\nRem architecto et repudiandae consequatur itaque ab. Enim quod sed non excepturi. Non eligendi ut tempore quas perferendis illo qui. Expedita non qui maiores unde at ratione blanditiis.\n\nVitae reiciendis quia totam soluta qui delectus corporis. Iure voluptas illum occaecati deserunt debitis ut. Tenetur aut officia suscipit laboriosam velit id.\n\nEt commodi odit ea aut quisquam ea cum. Sunt culpa temporibus temporibus optio sint sed. Facere ullam id tenetur qui nemo nulla quibusdam.\n\nEt aliquam error et in. Et dolorem soluta enim accusamus. Rerum sunt corrupti consequatur rerum maxime excepturi. Et expedita necessitatibus harum qui natus. Eveniet animi et fuga rerum animi animi et similique.",
                                                                         bodyShort: nil),
                                                       Tabaco.TabacoData(id: 3,
                                                                         active: false,
                                                                         name: "Eius neque omnis nulla.",
                                                                         body: "Ut minima dolor amet non magnam. Est eaque ut sint ea vitae magnam. Non earum recusandae et rerum cumque labore.\n\nEt repellat dolor laborum sunt voluptatem sit libero. Non saepe similique quia amet iste et. Ea sit sapiente dolor dicta sed eius.\n\nMaxime enim porro non. Animi ut quibusdam modi a saepe. Omnis nihil quia eum commodi blanditiis vel dicta officia. Vel vitae quasi animi voluptate voluptatem consequatur sint quia.\n\nCorporis est sint sint dolores ipsa. Veritatis inventore dolores beatae ad suscipit ex. Ullam veritatis dolor qui.\n\nEius labore magnam nostrum quo numquam aut et. Odit perspiciatis cupiditate harum dolorum. Et rerum aliquam neque et velit. Distinctio non nihil et autem. Nihil soluta non ipsa alias architecto consequatur.\n\nUt qui deserunt dolor non perferendis. Molestiae at impedit aperiam id laudantium. Suscipit voluptas quia est omnis.\n\nSaepe et nulla doloremque explicabo quas voluptatem. Dolore ipsa asperiores impedit ad. Rem qui repudiandae dignissimos sequi.\n\nEst asperiores quia corporis nihil ab distinctio qui. Unde debitis quis et. Non est voluptatem eveniet et est quod. Omnis culpa odio et maiores.",
                                                                         bodyShort: nil)]),
                  MiksData(id: 2,
                           active: true,
                           name: "Кальянная cмесь Eleon - Strong Berry (Лесные ягоды и ревень)",
                           bodyShort: "Cладкие и ароматные лесные ягоды, удачно дополняет вкус  терпкого и кисло-сладкого ревеня",
                           imageURL: "4image",
                           count: "50 гр", comprises: []),
                  MiksData(id: 3,
                           active: true,
                           name: "Кальянная cмесь Eleon - Blue Legend (Синяя легенда)",
                           bodyShort: "Аромат сладкой лесной черники с приятной коктейльной свежестью.",
                           imageURL: "3.1image",
                           count: "50 гр", comprises: []),
                  MiksData(id: 4,
                           active: true,
                           name: "Кальянная cмесь Eleon - Brownie (Брауни)",
                           bodyShort: "Воздушный бисквит с ароматным черным шоколадом и нежной ноткой обжаренного миндаля с карамелью.",
                           imageURL: "2image",
                           count: "50 гр", comprises: []),
                  MiksData(id: 5,
                           active: true,
                           name: "Eleon - Black Soda (Черная Газировка)",
                           bodyShort: "Сладкий карамельный вкус популярной во всем мире «чёрной газировки», с приятным послевкусием душистых трав.",
                           imageURL: "4image",
                           count: "50 гр", comprises: []),
                  MiksData(id: 6,
                           active: true,
                           name: "Eleon - Cheese Mix (Сырный микс)",
                           bodyShort: "Cовершенно необычный вкус. Сочетание манго с терпким пармезаном и ноткой меда на послевкусии.",
                           imageURL: "4image",
                           count: "50 гр", comprises: [])]
    
}
    
