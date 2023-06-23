//
//  Post.swift
//  Navigation
//
//  Created by Arsham Oganesian on 24.05.2023.
//

import Foundation

struct Post {
    let author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    
    static func makeFeed() -> [Post]{
        var posts: [Post] = [Post]()
        posts.append(Post(author: "Your travel", description: "Тропический рай: Открытие спрятанных красот на Малайзийских островах", image: "Image4", likes: 12, views: 144))
        posts.append(Post(author: "Hot tours", description: "Гастрономический тур: Восхитительное путешествие в поисках лучших блюд Италии", image: "Image3", likes: 13, views: 132))
        posts.append(Post(author: "Visit all country", description: "Встреча с природой: Захватывающие виды в горной Шории", image: "Image2", likes: 15, views: 138))
        posts.append(Post(author: "Around world", description: "Семейное приключение: Как мы путешествовали на машине через всю страну с детьми в багажнике", image: "Image1", likes: 22, views: 195))
        return posts
    }
}



