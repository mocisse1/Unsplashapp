//
//  CollectioVC.swift
//  Unsplashapp
//
//  Created by Mamoudou Cisse on 3/23/23.
//

import Foundation
import UIKit
import AVKit
import AVFoundation
class CollectioVC: UIViewController, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    var alertController = UIAlertController()
    var isDownloading = false
    let photoUrl = "https://api.unsplash.com/"
    let videoUrl = "https://api.unsplash.com/"
    var url = ""
    var photos = User()
    var image = WelcomeLinks()
    var query: String?
    var isPagination = false
    @IBOutlet weak var mediaCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mediaCollectionView.dataSource = self
        mediaCollectionView.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}
