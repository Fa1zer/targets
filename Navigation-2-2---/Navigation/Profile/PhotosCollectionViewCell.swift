//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 28.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    var image: ProfilePost? {
        didSet {
            backgroundView = UIImageView(image: UIImage(named: image!.image))
            backgroundView?.contentMode = .scaleAspectFit
            backgroundView?.backgroundColor = .black
        }
    }
}
