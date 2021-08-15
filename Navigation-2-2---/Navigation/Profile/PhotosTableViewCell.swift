//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 26.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var images: [ProfilePost]? {
        didSet {
            imageFirst.image = UIImage(named: (images?[0].image)!)
            imageSecond.image = UIImage(named: (images?[1].image)!)
            imageThird.image = UIImage(named: (images?[2].image)!)
            imageFourth.image = UIImage(named: (images?[3].image)!)
        }
    }
    
    private let stackView: UIStackView = {
       let view = UIStackView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 8
        
        return view
    }()
    
    private let photosLabel: UILabel = {
       let label = UILabel()
        
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let arrow: UIImageView = {
        let arrow = UIImageView(image: UIImage(systemName: "arrow.right"))
        
        arrow.tintColor = .black
        arrow.translatesAutoresizingMaskIntoConstraints = false
        
        return arrow
    }()
    
    private let imageFirst: UIImageView = {
        let image = UIImageView()
        
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        
        return image
    }()
    
    private let imageSecond: UIImageView = {
        let image = UIImageView()
        
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        
        return image
    }()
    
    private let imageThird: UIImageView = {
        let image = UIImageView()
        
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        
        return image
    }()
    
    private let imageFourth: UIImageView = {
        let image = UIImageView()
        
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        
        return image
    }()
    
    private func setupViews() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(arrow)
        contentView.addSubview(stackView)
        
        stackView.addSubview(imageFirst)
        stackView.addSubview(imageSecond)
        stackView.addSubview(imageThird)
        stackView.addSubview(imageFourth)
        
        let constraints = [photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                           photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                           
                           arrow.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
                           arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                           
                           stackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor),
                           stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                           stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                               constant: -12),
                           stackView.heightAnchor.constraint(equalTo: imageFirst.heightAnchor),
                           stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

                           imageFirst.topAnchor.constraint(equalTo: stackView.topAnchor),
                           imageFirst.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
                           imageFirst.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
                           imageFirst.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25,
                                                             constant: -12),
                           imageFirst.heightAnchor.constraint(equalTo: imageFirst.widthAnchor),
                           
                           imageSecond.topAnchor.constraint(equalTo: stackView.topAnchor),
                           imageSecond.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
                           imageSecond.leadingAnchor.constraint(equalTo: imageFirst.trailingAnchor,
                                                                constant: stackView.spacing),
                           imageSecond.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25,
                                                             constant: -12),
                           imageSecond.heightAnchor.constraint(equalTo: imageSecond.widthAnchor),
                           
                           imageThird.topAnchor.constraint(equalTo: stackView.topAnchor),
                           imageThird.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
                           imageThird.leadingAnchor.constraint(equalTo: imageSecond.trailingAnchor,
                                                                constant: stackView.spacing),
                           imageThird.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25,
                                                             constant: -12),
                           imageThird.heightAnchor.constraint(equalTo: imageThird.widthAnchor),
                           
                           imageFourth.topAnchor.constraint(equalTo: stackView.topAnchor),
                           imageFourth.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
                           imageFourth.leadingAnchor.constraint(equalTo: imageThird.trailingAnchor,
                                                                constant: stackView.spacing),
                           imageFourth.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25,
                                                             constant: -12),
                           imageFourth.heightAnchor.constraint(equalTo: imageFourth.widthAnchor),
                           imageFourth.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)]
        
        NSLayoutConstraint.activate(constraints)
    }
}
