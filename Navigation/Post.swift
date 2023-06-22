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
        posts.append(Post(author: "Lermontov", description: "description", image: "avatar", likes: 12, views: 32))
        posts.append(Post(author: "Lermontov", description: "description", image: "Logo", likes: 12, views: 32))
        posts.append(Post(author: "Lermontov", description: "description", image: "Logo", likes: 12, views: 32))
        posts.append(Post(author: "Lermontov", description: "description", image: "avatar", likes: 12, views: 32))
        return posts
    }
}



