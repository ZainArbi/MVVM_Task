//
//  APIService.swift
//  MVVM_Task
//
//  Created by ZainAli on 08/09/2021.
//

import Foundation

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "https://jsonplaceholder.typicode.com/photos")!
    
    func apiToGetAlbumData(completion : @escaping ([AlbumData]) -> ()){
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let albumData = try! jsonDecoder.decode([AlbumData].self, from: data)
            
                    completion(albumData)
            }
        }.resume()
    }
}
