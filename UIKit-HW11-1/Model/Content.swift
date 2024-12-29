//
//  Content.swift
//  UIKit-HW11-1
//
//  Created by Дима on 12/22/24.
//

import Foundation

struct Content : Identifiable {
    let id = UUID().uuidString
    let pictureName: String
    
    public static func data() -> [Content] {
        [
            Content(pictureName: "poster1"),
            Content(pictureName: "photo2"),
            Content(pictureName: "poster2"),
            Content(pictureName: "poster3"),
            Content(pictureName: "photo1"),
        ]
    }
}
