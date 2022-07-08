
import Foundation

class MiksViewModel: ObservableObject {
    
    static let shared = MiksViewModel()
    
    public init() { }
    
    var mikses = [MiksData(id: 1,
                           active: true,
                           name: "Adalya - Jungle Jungle (Лимон, Лайм, Грейпфрут, Апельсин)",
                           bodyShort: "Приятный сливочный вкус в тандеме с личи даёт поистине неповторимый вкус. Самое то что бы вам скорее расслабиться после тяжелого трудового дня.",
                           imageURL: "3image",
                           count: "50 гр"),
                  MiksData(id: 2,
                           active: true,
                           name: "Кальянная cмесь Eleon - Strong Berry (Лесные ягоды и ревень)",
                           bodyShort: "Cладкие и ароматные лесные ягоды, удачно дополняет вкус  терпкого и кисло-сладкого ревеня",
                           imageURL: "4image",
                           count: "50 гр"),
                  MiksData(id: 3,
                           active: true,
                           name: "Кальянная cмесь Eleon - Blue Legend (Синяя легенда)",
                           bodyShort: "Аромат сладкой лесной черники с приятной коктейльной свежестью.",
                           imageURL: "3.1image",
                           count: "50 гр"),
                  MiksData(id: 4,
                           active: true,
                           name: "Кальянная cмесь Eleon - Brownie (Брауни)",
                           bodyShort: "Воздушный бисквит с ароматным черным шоколадом и нежной ноткой обжаренного миндаля с карамелью.",
                           imageURL: "2image",
                           count: "50 гр"),
                  MiksData(id: 5,
                           active: true,
                           name: "Eleon - Black Soda (Черная Газировка)",
                           bodyShort: "Сладкий карамельный вкус популярной во всем мире «чёрной газировки», с приятным послевкусием душистых трав.",
                           imageURL: "4image",
                           count: "50 гр"),
                  MiksData(id: 6,
                           active: true,
                           name: "Eleon - Cheese Mix (Сырный микс)",
                           bodyShort: "Cовершенно необычный вкус. Сочетание манго с терпким пармезаном и ноткой меда на послевкусии.",
                           imageURL: "4image",
                           count: "50 гр")]
    
}
    
