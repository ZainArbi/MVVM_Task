//
//  ViewController.swift
//  MVVM_Task
//
//  Created by ZainAli on 08/09/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var albumTableView: UITableView!
    
    private var albumViewModel : AlbumViewModel!
    private var dataSource : AlbumTableViewDataSource<AlbumTableViewCell,AlbumData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        albumTableView.estimatedRowHeight = 116
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        callToViewModelForUIUpdate()
    }

    func callToViewModelForUIUpdate(){
        
        self.albumViewModel = AlbumViewModel()
        self.albumViewModel.bindAlbumViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = AlbumTableViewDataSource(cellIdentifier: "AlbumTableViewCell", items: self.albumViewModel.albumData, configureCell: { (cell, avm) in
            cell.albumTitle.text = avm.title
            cell.albumImage.load(url: URL(string: avm.thumbnailUrl))
        })
        
        DispatchQueue.main.async {
            self.albumTableView.dataSource = self.dataSource
            self.albumTableView.reloadData()
        }
    }
}
