//
//  TableViewCell.swift
//  MyHabits
//
//  Created by Миннулин Валерий Русланович on 14.04.2024.
//

import UIKit

class HabitViewCell: UITableViewCell {
    
    var habit: Habit? = nil
    static let ID = "HabitViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private let habitName: UILabel = UILabel()
    private let verticalStack: UIStackView = UIStackView()
    private let lastDaysView = LastDaysView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.backgroundColor = UIColor.clear
        verticalStack.layer.cornerRadius = 12
        verticalStack.axis = .vertical
        verticalStack.backgroundColor = Theme.cardBackground
        contentView.addSubview(verticalStack)

        habitName.textColor = UIColor.white
        
        verticalStack.addArrangedSubview(habitName)
    
        verticalStack.layoutMargins = UIEdgeInsets(top:16, left:16, bottom:16, right:16)
        verticalStack.isLayoutMarginsRelativeArrangement = true
       
        
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            verticalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
        
        
        verticalStack.addArrangedSubview(lastDaysView)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    func setHabit(habit: Habit) {
        self.habit = habit
        lastDaysView.setHabit(habit: habit)
        self.habitName.text = habit.title
        print("habit \(habit.title) was set")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

