//
//  DateView.swift
//  MyHabits
//
//  Created by Миннулин Валерий Русланович on 24.04.2024.
//

import UIKit

class DateView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private let dayOfWeekText = UILabel()
    private let dayOfMonthText = UILabel()
    private let circle = Circle()
    
    
    private var habit: Habit?
    private var date: Date?
    
    private var feedback = UIImpactFeedbackGenerator()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    
        dayOfWeekText.textColor = .lightGray
    
        
        dayOfMonthText.textColor = .white

        dayOfWeekText.font = dayOfWeekText.font.withSize(10)
        dayOfMonthText.font = dayOfMonthText.font.withSize(10)
    
        let dayStack = UIStackView()
        dayStack.axis = .horizontal
        dayStack.addArrangedSubview(dayOfMonthText)
        dayStack.addArrangedSubview(dayOfWeekText)
        dayStack.setCustomSpacing(4, after: dayOfMonthText)
        
        
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.alignment = .center
        verticalStack.addArrangedSubview(dayStack)
        verticalStack.addArrangedSubview(circle)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 50),
            self.widthAnchor.constraint(equalToConstant: 50),
        ])
        self.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: self.topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])

        self.addGestureRecognizer(UILongPressGestureRecognizer(target:self, action:#selector(onDayClick)))
        
    }
    
    @objc private func onDayClick(sender: UILongPressGestureRecognizer) {
        if (sender.state == .began) {
            guard let date = date else {
                return
            }
            guard let habit = habit else {
                return
            }
            print("on day click")
            let isFilled = Model.instance.changeDateCheck(habit: habit, date: date)
            circle.setIsFilled(isFilled: isFilled)
            feedback.impactOccurred()
        }

    }
    
    func setDate(date: Date) {
        self.date = date
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "EEE"
        dayOfWeekText.text = dateFormatter.string(from: date).lowercased()
    
        let dayOfMonthTextDateFormatter = DateFormatter()
        dayOfMonthTextDateFormatter.locale = Locale(identifier: "ru_RU")
        dayOfMonthTextDateFormatter.dateFormat = "dd"
        dayOfMonthText.text = dayOfMonthTextDateFormatter.string(from: date).lowercased()

    }
    
    func setHabit(habit: Habit) {
        print("date view setHabit \(habit.title)")
        self.habit = habit
        guard let date = date else { return }
        let isChecked = habit.isChecked(date: date)
        circle.setIsFilled(isFilled: isChecked)
        print("date view setHabit \(habit.title) isChecked = \(isChecked)")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    

}


class Circle: UIView {
    
 var isFilled = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 20),
            self.heightAnchor.constraint(equalToConstant: 20),
        ])
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setIsFilled(isFilled: Bool) {
        self.isFilled = isFilled
        setNeedsDisplay()
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else {
            print("could not get graphics context")
            return
        }
        context.addEllipse(in: CGRect(x: 2, y: 2, width: 16.0, height: 16.0))
        if (isFilled) {
            context.setFillColor(UIColor.green.cgColor)
            context.fillPath()
        
        } else {
            context.setLineWidth(2)

            context.setStrokeColor(UIColor.white.cgColor)

            context.strokePath()
        }


    }
    
}
