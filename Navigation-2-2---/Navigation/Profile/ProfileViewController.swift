//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Artemiy Zuzin on 30.05.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

struct ProfilePost {
    var autor: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

class ProfileViewController: UIViewController {
    @IBOutlet private weak var navigationBar: UINavigationItem!
    @IBOutlet private weak var headerView: ProfileHeaderView!
    
    private let cellid = "post"
    private let logInViewControler = LogInViewController()
    private let posts: [ProfilePost] = [ProfilePost(autor: "apple",
                                              description: "AirTag — это суперлёгкий способ находить свои вещи. Прикрепите один трекер AirTag к ключам, а другой — к рюкзаку. И теперь их видно на карте в приложении «Локатор». Там же можно посмотреть, где находятся ваши устройства Apple, а также ваши друзья и семья.",
                                              image: "airtag", likes: 8484, views: 9009),
                                        
                                        ProfilePost(autor: "apple.russia",
                                              description: "Процессор A14 Bionic далеко впереди других процессоров iPhone. Система камер Pro гораздо лучше работает при слабом освещении — а на iPhone 12 Pro Max ещё лучше. Ceramic Shield в четыре раза снижает риск повреждений дисплея при падении. Давайте посмотрим, как тут всё устроено.",
                                              image: "iphone 12 pro max", likes: 7585, views: 9569),
                                
                                        ProfilePost(autor: "samsung",
                                              description: "Представляем новый Galaxy S21 Ultra 5G. Его камеры — это киностудия у вас в руках. С ее помощью вы сможете снимать видео 8К и превращать каждый его кадр в яркий снимок — просто «на ходу». А сочетание сверхбыстрого 5-нм процессора Exynos, прочного стеклянного корпуса и аккумулятора на целый день работы полностью оправдывает его название — Ultra.",
                                              image: "samsung", likes: 1344, views: 5453),
                                
                                        ProfilePost(autor: "samsung.russia",
                                              description: "Квантовый прорыв в мире изображения",
                                              image: "neo qled", likes: 4045, views: 5595)]
    
    private let exit: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "xmark"))
                
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .white
        image.isHidden = true
        image.isUserInteractionEnabled = true
        image.alpha = 0
                
        return image
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private let translucentView: UIView = {
       let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = 0
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        setupViews()
        
        navigationController?.pushViewController(LogInViewController(), animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        if translucentView.isHidden == false {
            
            tapExit()
        }
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        view.addSubview(exit)
                
        headerView.addSubview(translucentView)
        
        headerView.insertSubview(translucentView, at: 4)
                        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellid)
        
        let constraints = [tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                           tableView.bottomAnchor.constraint(equalTo:
                                                                view.safeAreaLayoutGuide.bottomAnchor),
                           tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                           tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                           translucentView.topAnchor.constraint(equalTo: view.topAnchor),
                           translucentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                           translucentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                           translucentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                           
                           exit.leadingAnchor.constraint(equalTo:
                                                            headerView.avatarImageView.leadingAnchor,
                                                         constant: 16),
                           exit.topAnchor.constraint(equalTo: headerView.avatarImageView.topAnchor,
                                                     constant: 16)]
        
        NSLayoutConstraint.activate(constraints)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        
        headerView.avatarImageView.isUserInteractionEnabled = true
        
        headerView.avatarImageView.addGestureRecognizer(tapGesture)
        
        let tapExitGesture = UITapGestureRecognizer(target: self, action: #selector(tapExit))
        
        exit.addGestureRecognizer(tapExitGesture)
    }
    
    @objc func tapImage() {
            
        translucentView.isHidden = false
        
        exit.isHidden = false

        UIView.animate(withDuration: 0.5, animations: { [self] in
            
            headerView.avatarImageView.transform = headerView.avatarImageView.transform.scaledBy(
                    x: view.safeAreaLayoutGuide.layoutFrame.width / headerView.avatarImageView.frame.width,
                    y: view.safeAreaLayoutGuide.layoutFrame.width / headerView.avatarImageView.frame.width)
            headerView.avatarImageView.frame.origin = CGPoint(
                x: view.safeAreaLayoutGuide.layoutFrame.minX, y: headerView.frame.minY)
           
            headerView.avatarImageView.layer.cornerRadius = 0
                    
            translucentView.alpha = 0.5
        })
        
        UIView.animate(withDuration: 0.3, delay: 0.5, animations: { self.exit.alpha = 1 })
    }
    
    @objc func tapExit() {
        UIView.animate(withDuration: 0.5, animations: { [self] in
            
            headerView.avatarImageView.transform = .identity
            headerView.avatarImageView.frame.origin = CGPoint(x:
                                                            view.safeAreaLayoutGuide.layoutFrame.minX + 16,
                                                              y: headerView.frame.minY + 16)
            
            headerView.avatarImageView.layer.cornerRadius = headerView.avatarImageView.frame.width / 2
        
            translucentView.alpha = 0
        })
        
        UIView.animate(withDuration: 0.3, delay: 0.5, animations: { self.exit.alpha = 0 })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [self] in
            
            translucentView.isHidden = true
    
            exit.isHidden = true
        }
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat
    { 220 }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    { UITableView.automaticDimension }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    { headerView }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    { posts.count + 1 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row != 0 else {
            let cell = PhotosTableViewCell()
            
            cell.images = posts
            
            return cell
        }
        
        let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellid,
                                          for: indexPath) as! PostTableViewCell
        
        cell.post = posts[indexPath.row - 1]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            let photosController = PhotosViewController()
            
            photosController.images = posts
            
            navigationController?.pushViewController(photosController, animated: true)
        }
    }
}
