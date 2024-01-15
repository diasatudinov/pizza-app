//
//  MainMenuView.swift
//  pizza app
//
//  Created by Dias Atudinov on 13.01.2024.
//

import UIKit

protocol MainMenuViewProtocol: AnyObject {
    func showPositions()
}

class MainMenuView: UIViewController {

    private var isPizza = false
    private var isCombo = false
    private var isDesrt = false
    private var isDrink = false
    private var previousContentOffsetY: CGFloat = 0

    var presenter: MainMenuPresenterProtocol!
    private let images: [UIImage] = [.banner, .banner2]
    private let categories: [String] = ["Пицца","Комбо","Десерты","Напитки"]
    private var topInsets: CGFloat = 0
    private var topMenuViewHeight = UIApplication.topSafeArea + 250
    
    private lazy var topMenuView: UIView = {
        $0.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: topMenuViewHeight)
        $0.layer.backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.976, alpha: 1).cgColor
        $0.addSubview(bannersScrollView)
        $0.addSubview(categoriesScrollView)
        
        return $0
    }(UIView())
    
    private lazy var topMenuCityName: UILabel = {
        $0.frame = CGRect(x: 16, y: 60, width: 61, height: 20)
        $0.textColor = UIColor(red: 0.133, green: 0.157, blue: 0.192, alpha: 1)
        $0.font = UIFont(name: "SFUIDisplay-Medium", size: 17)
        $0.text = "Москва"
        return $0
    }(UILabel())
    
    private lazy var topMenuCityButton: UIButton = {
        $0.frame = CGRect(x: topMenuCityName.bounds.width + 22, y: 66, width: 14, height: 8)
        $0.setBackgroundImage(.arrowCity, for: .normal)
        return $0
    }(UIButton())
    
    private lazy var categoryName: UILabel = {
        $0.frame = CGRect(x: 16, y: 260, width: 52, height: 16)
        $0.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        $0.font = UIFont(name: "SFUIDisplay-Bold", size: 13)
        $0.text = "Пицца"
        return $0
    }(UILabel())
    
    private lazy var bannersScrollView: UIScrollView = {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.frame = view.bounds
        $0.contentSize = CGSize(width: view.bounds.width * CGFloat(images.count), height: 112)
        $0.contentInset.top = 40

        
        return $0
    }(UIScrollView())
    
    private lazy var categoriesScrollView: UIScrollView = {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.frame = CGRect(x: 0, y: Int(bannersScrollView.frame.height - 600), width: 375, height: 32)
        $0.contentSize = CGSize(width: CGFloat(categories.count) * (view.frame.width - 40), height: 32)
        $0.contentInset.top = 20
        return $0
    }(UIScrollView())
    
    private lazy var collectionView: UICollectionView = {
        
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height/5)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        
        
        $0.contentInset.top = 250
        $0.layer.backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.976, alpha: 1).cgColor
        $0.dataSource = self
        $0.delegate = self
        $0.alwaysBounceVertical = true
        $0.register(PositionCell.self, forCellWithReuseIdentifier: PositionCell.reuseId)
        return $0
    }(UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout()))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Меню"
        
        view.addSubview(collectionView)
        view.addSubview(topMenuView)
        view.addSubview(topMenuCityName)
        view.addSubview(topMenuCityButton)
        
        topInsets = collectionView.adjustedContentInset.top
        
        for (index, image) in images.enumerated() {
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: topMenuView.bounds.width * CGFloat(index) + 16, y: 65, width: 350, height: 130)
            
            imageView.layer.cornerRadius = 10.0
            imageView.layer.masksToBounds = true
            imageView.contentMode = .scaleAspectFit
            bannersScrollView.addSubview(imageView)
        }
        
        for (index, buttonName) in categories.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(buttonName, for: .normal)
            let buttonWidth = (view.frame.width - 40) / CGFloat(categories.count)
            button.frame = CGRect(x: (CGFloat(index) * buttonWidth) + 16, y: 0, width: buttonWidth, height: 32)
            button.layer.cornerRadius = 25
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4).cgColor
            button.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4), for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

            categoriesScrollView.addSubview(button)
        }
        
        view.layer.backgroundColor = UIColor(red: 0.953, green: 0.961, blue: 0.976, alpha: 1).cgColor
        
    }

    @objc func buttonTapped(_ sender: UIButton) {
        if let title = sender.currentTitle, let index = categories.firstIndex(of: title) {
            print("Button at index \(index) with title '\(title)' was tapped")
        }
    }
}

extension MainMenuView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.presenter.positions?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PositionCell.reuseId, for: indexPath) as? PositionCell else {
            return UICollectionViewCell()
        }
        if let item = presenter.positions?[indexPath.row] {
            cell.configureCell(item: item)
        }
        
        return cell
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let topMenuPosition = scrollView.contentOffset.y + topInsets + 59
        
        if topMenuPosition <= 160, topMenuPosition >= 0 {
            topMenuView.frame.origin.y = -topMenuPosition
            self.bannersScrollView.alpha = (160 - topMenuPosition) / 160
        }
        
        print(scrollView.contentOffset.y)
       
    }
}

extension MainMenuView: MainMenuViewProtocol {
    func showPositions() {
        collectionView.reloadData()
    }
    
}


