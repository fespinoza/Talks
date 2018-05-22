//
//  QuizIntroViewController.swift
//  QuizKit
//
//  Created by Felipe Espinoza on 21/05/2018.
//  Copyright © 2018 Fespinozacast. All rights reserved.
//

public class QuizIntroViewController: UIViewController {
  let titleLabel = UILabel()
  let introTextLabel = UILabel()
  let newQuizButton = UIButton()

  public override func viewDidLoad() {
    with(view) {
      $0.backgroundColor = .white
    }

    with(titleLabel) {
      $0.font = UIFont.preferredFont(forTextStyle: .title1)
      $0.textColor = .black
      $0.text = "New Quiz"
    }

    with(introTextLabel) {
      $0.font = UIFont.preferredFont(forTextStyle: .body)
      $0.textColor = .black
      $0.numberOfLines = 0
      $0.lineBreakMode = .byWordWrapping
      $0.textAlignment = .center
      $0.text = "Let’s see how knowledgeable are you with a quiz challenge!"
    }

    with(newQuizButton) {
      $0.setTitle("Start Quiz 🎉", for: .normal)
      $0.backgroundColor = Style.blueColor
      $0.contentEdgeInsets = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
      $0.addTarget(self, action: #selector(self.newQuiz(_:)), for: .touchUpInside)
    }

    let stackView = with(UIStackView()) {
      $0.axis = .vertical
      $0.spacing = 27
      $0.alignment = .center
      $0.layoutMargins = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
      $0.isLayoutMarginsRelativeArrangement = true
    }

    // subviews
    view.addSubviews(stackView)

    stackView.addArrangedSubviews(
      titleLabel,
      introTextLabel,
      newQuizButton
    )

    // autolayout

    stackView.snp.makeConstraints({
      $0.leading.equalToSuperview().inset(20)
      $0.trailing.equalToSuperview().inset(20)
      $0.centerY.equalToSuperview()
    })
  }

  public override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    with(newQuizButton, configure: Style.roundedButton)
    with(titleLabel, configure: Style.enableDynamicFont)
    with(introTextLabel, configure: Style.enableDynamicFont)
  }

  @objc func newQuiz(_ sender: Any?) {
    let quizVC = QuizViewController()
    present(quizVC, animated: true, completion: nil)
  }
}
