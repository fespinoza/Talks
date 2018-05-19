//
//  QuizViewController.swift
//  QuizList
//
//  Created by Felipe Espinoza on 18/03/2018.
//  Copyright © 2018 Fespinozacast. All rights reserved.
//

import UIKit
import SnapKit

public class QuizViewController: UIViewController {
  override public func viewDidLoad() {
    super.viewDidLoad()

    let label = UILabel()
    label.text = "Soon a quiz will be here"

    self.view.addSubview(label)

    label.snp.makeConstraints { $0.center.equalToSuperview() }
  }
}
