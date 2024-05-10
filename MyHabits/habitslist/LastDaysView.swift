//
//  LastDaysView.swift
//  MyHabits
//
//  Created by Миннулин Валерий Русланович on 24.04.2024.
//

import UIKit

class LastDaysView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    private var dates: Array<DateView> = Array()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layoutWidth = frame.width
        let dateWidth = 20
        let datesNumber = layoutWidth / 20
        let stack = UIStackView()
        
        let visibleDays = 5
        for i in 0...visibleDays {
            let dateView = DateView(frame: frame)
            dates.append(dateView)
            let currentDate = Date()
            let daysAgoForCurrentLabel = visibleDays - i
            if let date = Calendar.current.date(byAdding: .day, value: -daysAgoForCurrentLabel, to: currentDate) {
                dateView.setDate(date: date)
            }
            stack.addArrangedSubview(dateView)
        }
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stack.leftAnchor.constraint(equalTo: self.leftAnchor),
            stack.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
        
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .fill
    }
    
    func setHabit(habit: Habit) {
        print("last days view setting habit to dates \(habit.title)")
        dates.forEach { dateView in
            dateView.setHabit(habit: habit)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
