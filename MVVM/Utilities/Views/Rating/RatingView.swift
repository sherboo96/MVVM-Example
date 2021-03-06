//
//  RatingView.swift
//  MVVM
//
//  Created by Mahmoud Sherbeny on 26/09/2021.
//

import Foundation
import UIKit

class RatingView: UIView {
    var rating = 5
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupUI()
    }
    
    func setupUI() {
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
//            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func configureWithRating(rating: Int, style: StyleType = .full) {
        self.stackView.removeAllArrangedSubviews()
        switch style {
        case .full:
            self.fullStar()
        case .compact:
            self.oneStar()
        }
    }
    
    private func fullStar() {
        let filledRating = rating
        if filledRating > 0 {
            for _ in 0..<filledRating {
                stackView.addArrangedSubview(self.generateStarView(.filled))
            }
        }
        
        let nonFilledRating = self.rating - filledRating
        if nonFilledRating > 0 {
            for _ in 0..<nonFilledRating {
                stackView.addArrangedSubview(self.generateStarView(.nonFilled))
            }
        }
    }
    
    private func oneStar() {
        self.stackView.addArrangedSubview(self.generateStarView(.filled))
    }
    
    func generateStarView(_ type: Startype) -> UIImageView {
        var starImage: UIImage?
        switch type {
        case .filled:
            starImage = UIImage(systemName: "star.fill")
        case .nonFilled:
            starImage = UIImage(systemName: "star")
        }
        let imageView = UIImageView(image: starImage)
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 10).isActive = true
        return imageView
    }
    
    enum Startype {
        case filled
        case nonFilled
    }
    
    enum StyleType {
        case full, compact
    }
}
