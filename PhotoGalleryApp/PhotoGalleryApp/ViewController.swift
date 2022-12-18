//
//  ViewController.swift
//  PhotoGalleryApp
//
//  Created by MZ01-MINCKAN on 2022/12/16.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {
    
    var fetchResult:PHFetchResult<PHAsset>?

    @IBOutlet weak var photoCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photo Gallery App"
        makeNavigationItem()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width / 2 - 0.5, height:  UIScreen.main.bounds.size.width / 2)
        
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        
        photoCollectionView.collectionViewLayout = layout
        photoCollectionView.dataSource = self

        
    }
    
    func makeNavigationItem() {
        let photoItem = UIBarButtonItem(image: UIImage(systemName: "photo.on.rectangle.angled"), style: .done, target: self, action: #selector(checkPermission))
        photoItem.tintColor = .black.withAlphaComponent(0.7)
        
        self.navigationItem.rightBarButtonItem = photoItem
        
        let refreshItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refresh))
        refreshItem.tintColor = .black.withAlphaComponent(0.7)
        self.navigationItem.leftBarButtonItem = refreshItem
    }

    @objc func checkPermission() {
        if PHPhotoLibrary.authorizationStatus() == .authorized || PHPhotoLibrary.authorizationStatus() == .limited {
            DispatchQueue.main.async {
                self.showGallery()
            }
            
        } else if PHPhotoLibrary.authorizationStatus() == .denied {
            DispatchQueue.main.async {
                self.showAuthorizationDeniedAlert()
            }
            
        } else if PHPhotoLibrary.authorizationStatus() == .notDetermined {
            // not determined 안물어본상태
            PHPhotoLibrary.requestAuthorization { status in
                self.checkPermission()
            }
        }
    }
    
    func showAuthorizationDeniedAlert() {
        let alert  = UIAlertController(title: "포토 라이브러리 접근 권한을 활성회 해주세요.", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "설정으로 가기", style: .default, handler: { action in
            guard let url = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
     func showGallery() {
        let library = PHPhotoLibrary.shared()
        
        var configuration = PHPickerConfiguration(photoLibrary: library)
        configuration.selectionLimit = 10
        
        let picker = PHPickerViewController(configuration: configuration)
        
        picker.delegate = self
        
        present(picker, animated: true, completion: nil)
        
        
    }
    
    @objc func refresh() {
        self.photoCollectionView.reloadData()
    }

}

extension ViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        if let asset = self.fetchResult?[indexPath.row] {
            cell.loadImage(asset: asset)
        }
        
        return cell
    }
    
    
}

extension ViewController:PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//        results.map($0.assetIdentifier )
        let identifiers = results.map{
            $0.assetIdentifier ?? ""
        }
        
        self.fetchResult = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
        
        self.photoCollectionView.reloadData()
        

        self.dismiss(animated: true)
    }
    
    
}
