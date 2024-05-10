//
//  CreateHabitViewController.swift
//  MyHabits
//
//  Created by Миннулин Валерий Русланович on 14.04.2024.
//

import UIKit

class CreateHabitViewController: UIViewController {

    @IBOutlet weak var habitTitleField: UITextField!
    
    var onAddListener: () -> Void = {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClick(_ sender: Any) {
        let habitName = habitTitleField.text ?? ""
        if(!habitName.isEmpty) {
            Model.instance.addHabit(habit: Habit(title: habitName))
            self.dismiss(animated: true)
            onAddListener()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
