//
//  TopAppBar.swift
//  MyHabits
//
//  Created by Миннулин Валерий Русланович on 29.04.2024.
//

import UIKit

class TopAppBar: UIView {
    
    var onPlusClick: () -> Void = {}

    override init(frame: CGRect) {
        super.init(frame: frame)
        

        
        let titleLabel = UILabel()
        addSubview(titleLabel)
        titleLabel.text = "Привычки"
        titleLabel.textColor = .white
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        
        let plusButton = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)
        let plusImage = UIImage(systemName: "plus", withConfiguration: configuration)
        
        plusButton.tintColor = .white
        plusButton.setImage(plusImage, for: .normal)
        plusButton.addTarget(self, action: #selector(onButtonClick), for: .touchUpInside)
        
        
        addSubview(plusButton)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            plusButton.topAnchor.constraint(equalTo: self.topAnchor),
            plusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            plusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
    }

    
    @objc private func onButtonClick() {
        onPlusClick()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
