//
//  Post.swift
//  Navigation
//
//  Created by m.isaeva on 11.07.2022.
//

import Foundation

public struct Post {
    public var author: String
    public var description: String
    public var image: String
    public var likes: Int
    public var views: Int
}

public extension Post {
    static func publications() -> [Post] {
        [
            Post(
                author: "Лайфхакер",
                 description: "Прокачка с двумя гирями: 4 упражнения для сильного пресса",
                 image: "Тренировка",
                 likes: 345,
                 views: 567
                ),
            Post(
                author: "Царское село",
                 description: "В последние дни сентября еще цветут розы, гортензии и бегонии в Екатерининском парке. Ускользающая красота.",
                 image: "Розы",
                 likes: 4,
                 views: 56
                ),
            Post(
                author: "СТИХОТВОРЕНИЕ ДНЯ",
                 description: """
«Сентябрь»
Раззолочённые, но чахлые сады
С соблазном пурпура на медленных недугах,
И солнца поздний пыл в его коротких дугах,
Невластный вылиться в душистые плоды.
И желтый шелк ковров, и грубые следы,
И понятая ложь последнего свиданья,
И парков черные, бездонные пруды,
Давно готовые для спелого страданья...
Но сердцу чудится лишь красота утрат,
Лишь упоение в завороженной силе;
И тех, которые уж лотоса вкусили,
Волнует вкрадчивый осенний аромат.
Иннокентий Анненский
""",
                 image: "Осень",
                 likes: 45,
                 views: 134
                ),
            Post(
                author: "Интересные факты",
                 description: "Необычные дорожные знаки со всего мира",
                 image: "Знак",
                 likes: 763,
                 views: 1567
                ),
        ]
    }
}
