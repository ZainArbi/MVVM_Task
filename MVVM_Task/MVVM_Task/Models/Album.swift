//
//  Album.swift
//  MVVM_Task
//
//  Created by ZainAli on 08/09/2021.
//

import Foundation

// MARK: - Datum
struct AlbumData: Decodable {
    var albumId: Int
    var title, thumbnailUrl : String

    init(albumId: Int, title: String, thumbnailUrl: String) {
        self.albumId = albumId
        self.title = title
        self.thumbnailUrl = thumbnailUrl
    }
    
    enum CodingKeys: String, CodingKey {
        case albumId = "albumId"
        case title = "title"
        case thumbnailUrl = "thumbnailUrl"
    }
}
