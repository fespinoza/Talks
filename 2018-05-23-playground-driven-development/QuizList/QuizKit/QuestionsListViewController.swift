//
//  QuestionsListViewController.swift
//  QuizList
//
//  Created by Felipe Espinoza on 18/03/2018.
//  Copyright © 2018 Fespinozacast. All rights reserved.
//

import UIKit
import SnapKit

public class QuestionsListViewController: UIViewController {
  let dataStorage = DataStorage.example()

  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.register(QuizCell.self, forCellReuseIdentifier: "quizCell")
    tableView.dataSource = self
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 100

    return tableView
  }()

  public override func viewDidLoad() {
    super.viewDidLoad()

    self.view.addSubview(tableView)

    self.tableView.snp.makeConstraints {
      $0.edges.equalTo(self.view.safeAreaLayoutGuide)
    }
  }

  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    self.navigationController?.navigationBar.prefersLargeTitles = true
    self.navigationItem.title = "Questions"
  }
}

extension QuestionsListViewController: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataStorage.quizes.count
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "quizCell", for: indexPath) as! QuizCell
    let quiz = dataStorage.quizes[indexPath.row]

    cell.questionLabel.text = quiz.question

    return cell
  }
}

extension QuestionsListViewController: UITableViewDelegate {

}
