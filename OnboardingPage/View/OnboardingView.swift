//
//  OnboardingView.swift
//  OnboardingPage
//
//  Created by Saadet Şimşek on 13/03/2025.
//

import UIKit

class OnboardingView: UIView {
    
    private let pageLabel: UILabel = {
        let labell = UILabel()
        labell.textColor = .white
        labell.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        labell.textAlignment = .center
        labell.numberOfLines = 0
        labell.translatesAutoresizingMaskIntoConstraints = false
        return labell
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(pageLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setPageLabelText(text: String){
        pageLabel.text = text
    }
    
    public func setPageLabelTransform(transform: CGAffineTransform){
        pageLabel.transform = transform
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            pageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            pageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            pageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            pageLabel.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}
