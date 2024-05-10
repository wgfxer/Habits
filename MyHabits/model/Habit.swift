//
//  Habit.swift
//  MyHabits
//
//  Created by Миннулин Валерий Русланович on 14.04.2024.
//

import Foundation

/**
 * Модель для привычки. 
 */
class Habit: Codable {
    let title: String
    var doneDays: Set<Date> = Set()

    
    init(title: String) {
        self.title = title
    }
    
    func changeDateCheck(date: Date) -> Bool {
        let date = Calendar.current.startOfDay(for: date)
        if (doneDays.contains(date)) {
            doneDays.remove(date)
            return false
        } else {
            doneDays.update(with: date)
            return true
        }
        
    }

    func isChecked(date: Date) -> Bool {
        let date = Calendar.current.startOfDay(for: date)
        return doneDays.contains(date)
    }
}
