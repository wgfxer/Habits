//
//  Model.swift
//  MyHabits
//
//  Created by Миннулин Валерий Русланович on 14.04.2024.
//

import Foundation


class Model {
    
    var habits: [Habit] = []
    
    static let CACHE_KEY: String = "HABITS_CACHE_KEY"
    
    static let instance = Model()
    
    init() {
        if let data = FileManager.default.contents(atPath: filePath(key: Model.CACHE_KEY)) {
            let habitsList = try? JSONDecoder().decode(HabitsList.self, from: data)
            habits = habitsList?.habits ?? []
        }

    }
    
    func addHabit(habit: Habit) {
        habits.append(habit) 
        saveCache()
    }
    
    func changeDateCheck(habit: Habit, date: Date) -> Bool {
        let wasAdded = habit.changeDateCheck(date: date)
        saveCache()
        return wasAdded
    }
    
    private func saveCache() {
        let habitsList = HabitsList(habits: habits)
        if let data = try? JSONEncoder().encode(habitsList) {
            FileManager.default.createFile(atPath: filePath(key: Model.CACHE_KEY), contents: data)
        }
        
    }
    
    private func filePath(key: String) -> String {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsDirectory.appendingPathComponent("\(key).json").path
    }
}

class HabitsList: Codable {
    var habits: [Habit]
    
    init(habits: [Habit]) {
        self.habits = habits
    }
}
