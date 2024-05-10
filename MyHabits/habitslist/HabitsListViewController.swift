//
//  HabitsListViewController.swift
//  MyHabits
//
//  Created by Миннулин Валерий Русланович on 13.04.2024.
//

import UIKit

class HabitsListViewController: UIViewController, UITableViewDataSource {
    
    let model = Model.instance
    
    private let habitsList: UITableView = UITableView()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HabitViewCell.ID, for: indexPath)
        cell.selectionStyle = .none
        if let habitCell = cell as? HabitViewCell {
            let habit = model.habits[indexPath.row]
            print("setting habit \(habit.title)")
            habitCell.setHabit(habit: habit)
        }
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        habitsList.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? CreateHabitViewController {
            dest.onAddListener = { [weak self] in
                self?.habitsList.reloadData()
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let stackView = UIStackView()
        stackView.axis = .vertical
        let topAppBar = TopAppBar()
        topAppBar.onPlusClick = { [weak self] in
            self?.performSegue(withIdentifier: "goToAddHabit", sender: nil)
        }
        stackView.addArrangedSubview(topAppBar)
        stackView.addArrangedSubview(habitsList)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
        habitsList.register(HabitViewCell.self, forCellReuseIdentifier: HabitViewCell.ID)
        habitsList.dataSource = self
        habitsList.separatorStyle = .none
        view.backgroundColor = Theme.screenBackground
        habitsList.backgroundColor = UIColor.clear
    }

    
}

