//
//  PositionCell.swift
//  pizza app
//
//  Created by Dias Atudinov on 14.01.2024.
//

import UIKit

class PositionCell: UICollectionViewCell {
    static let reuseId = "positionCell"
    
    lazy var image: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: CGRect(x: 18, y: 24, width: 131, height: 131)))
    
    
    lazy var nameLabel: UILabel = {
        
        $0.frame = CGRect(x: 181, y: 32, width: 170, height: 20)
        $0.textColor = UIColor(red: 0.133, green: 0.157, blue: 0.192, alpha: 1)
        $0.font = UIFont(name: "SFUIDisplay-Semibold", size: 17)
        return $0
        
    }(UILabel())
    
    lazy var descriptionLabel: UILabel = {
        
        $0.frame = CGRect(x: 181, y: 60, width: 171, height: 64)
        $0.textColor = UIColor(red: 0.665, green: 0.668, blue: 0.679, alpha: 1)
        $0.font = UIFont(name: "SFUIDisplay-Regular", size: 13)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        
        return $0
        
    }(UILabel())
    
    lazy var priceButtonPressed = UIAction { [weak self] sender in
       print("tapped")
    }
    
    lazy var priceButton: UIButton = {
        
        $0.frame = CGRect(x: 264, y: 129, width: 87, height: 32)
        $0.setTitle("Нажми меня", for: .normal)
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1).cgColor
        $0.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1), for: .normal)
        $0.layer.cornerRadius = 5.0
        
        return $0
        
    }(UIButton(primaryAction: priceButtonPressed))
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(image)
        addSubview(priceButton)
    }
    
    func configureCell(item: MenuItem){
        image.image = UIImage(named: item.image)
        nameLabel.text = item.name
        descriptionLabel.text = item.description
        priceButton.setTitle("от \(item.price) р", for: .normal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   
}
