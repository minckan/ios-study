//
//  PhotoCell.swift
//  PhotoGalleryApp
//
//  Created by MZ01-MINCKAN on 2022/12/16.
//

import UIKit
import PhotosUI

class PhotoCell : UICollectionViewCell {
    
    func loadImage(asset: PHAsset) {
        let imageManager = PHImageManager()
        let scale = UIScreen.main.scale
        let imageSize = CGSize(width: 150 * scale, height: 150 * scale)
        
//        let options = PHImageRequestOptions()
//        options.deliveryMode = .opportunistic
//
//        self.photoImageView.image = nil
        
        imageManager.requestImage(for: asset, targetSize:imageSize , contentMode: .aspectFill, options: nil) { image, info in
//            if(info?[PHImageResultIsDegradedKey] as? Bool) == true {
//                //저화질
//                self.photoImageView.image = image
//            } else {
//                //고화질
//            }
//
            self.photoImageView.image = image
            
        }
    }
    
    @IBOutlet weak var photoImageView: UIImageView! {
        didSet {
            photoImageView.contentMode = .scaleAspectFill
        }
    }
}
