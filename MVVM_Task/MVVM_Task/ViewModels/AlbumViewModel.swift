//
//  AlbumViewModel.swift
//  MVVM_Task
//
//  Created by ZainAli on 08/09/2021.
//

import Foundation
import UIKit
import CoreData

class AlbumViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var albumData : [AlbumData]! {
        didSet {
            self.bindAlbumViewModelToController()
        }
    }
    var bindAlbumViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService = APIService()
        callFuncToGetAlbumData()
    }
    
    func callFuncToGetAlbumData() {
        self.apiService.apiToGetAlbumData { (albumData) in
            self.albumData = albumData
            self.saveDataLocally(albumArray: self.albumData)
        }
    }
    
    func saveDataLocally(albumArray: [AlbumData]) {
        DispatchQueue.main.async {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Albums", in: context)
            let albumData = NSManagedObject(entity: entity!, insertInto: context)
            
            for album in albumArray {
                albumData.setValue(album.albumId, forKey: "albumId")
                albumData.setValue(album.title, forKey: "title")
                albumData.setValue(album.thumbnailUrl, forKey: "thumbnailUrl")
            }
            do {
               try context.save()
              } catch {
               print("Failed saving")
            }
        }
    }
}
