//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 27.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    var images =  [UIImageView]()
    
    private let layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        navigationItem.title = "Photo Gallery"
        
        collectionView.dataSource = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier:
                                    String(describing: PhotosCollectionViewCell.self))
        
        setupViews()
    }
    
    private func setupViews() {
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .none
        
        let constraints = [collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
                           collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                           collectionView.leadingAnchor.constraint(equalTo:
                                                            view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
                           collectionView.trailingAnchor.constraint(equalTo:
                                                        view.safeAreaLayoutGuide.trailingAnchor, constant: -8)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layout.itemSize = CGSize(width: (collectionView.frame.width - 16) / 3,
                                 height: (collectionView.frame.width - 16) / 3)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
    }
    
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    { images.count }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotosCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                String(describing: PhotosCollectionViewCell.self),
                                                                    for: indexPath) as! PhotosCollectionViewCell

        guard images.isEmpty == false else {
            return cell
        }

        cell.image = images[indexPath.item]

        return cell
    }
}
