//
//  Photo.swift
//  Navigation
//
//  Created by Arsham Oganesian on 29.06.2023.
//

import UIKit

struct Photo {
    
    var image: String
    
    static func makeGallery() -> [Photo] {
        var gallery = [Photo]()
        var number = 0
        
        for _ in 1...20 {
            number += 1
            gallery.append(Photo(image: "Image" + String(number)))
        }
        return gallery
    }
}
