//
//  QuizView.swift
//  QuizList
//
//  Created by Felipe Espinoza on 19/03/2018.
//  Copyright © 2018 Fespinozacast. All rights reserved.
//

import UIKit
import SnapKit

public class QuizView: UIView {
  // MARK: - Public properties
  public var questionAnsweredCallback: (() -> Void)?
  public var quiz: Quiz? {
    didSet {
      updateQuiz()
    }
  }

  // MARK: - Internal properties
  private let buttonsStackView = UIStackView()
  private let questionLabel = UILabel()
  private let answerLabel = UILabel()
  private let correctAnswerButton = UIButton()
  private let incorrectAnswerButton = UIButton()

  // MARK: - Initializers
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  // MARK: - Private methods
  private func setup() {
    self.layer.borderColor = UIColor.black.cgColor
    self.layer.borderWidth = 2.0
    self.layoutMargins = UIEdgeInsetsMake(20, 30, 20, 30)

    self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showAnswer(_:))))

    questionLabel.numberOfLines = 0
    questionLabel.lineBreakMode = .byWordWrapping
    answerLabel.numberOfLines = 0
    answerLabel.lineBreakMode = .byWordWrapping

//    let bundle = Bundle(for: QuizView.self)
//    let incorrectIcon = UIImage(named: "cross-icon", in: bundle, compatibleWith: self.traitCollection)
    let incorrectIcon = UIImage(named: "cross-icon")
    incorrectAnswerButton.setImage(incorrectIcon, for: .normal)

//    let correctImage = UIImage(named: "check-icon", in: bundle, compatibleWith: self.traitCollection)
    let correctImage = UIImage(named: "check-icon")
    correctAnswerButton.setImage(correctImage, for: .normal)

    correctAnswerButton.addTarget(self, action: #selector(answerQuestion(_:)), for: .touchUpInside)
    incorrectAnswerButton.addTarget(self, action: #selector(answerQuestion(_:)), for: .touchUpInside)

    let verticalStackView = UIStackView()
    verticalStackView.axis = .vertical
    verticalStackView.alignment = .center
    verticalStackView.spacing = 20

    buttonsStackView.axis = .horizontal
    buttonsStackView.spacing = 30
    buttonsStackView.isHidden = true

    // subviews
    verticalStackView.addArrangedSubview(questionLabel)
    verticalStackView.addArrangedSubview(answerLabel)
    buttonsStackView.addArrangedSubview(correctAnswerButton)
    buttonsStackView.addArrangedSubview(incorrectAnswerButton)

    self.addSubview(verticalStackView)
    self.addSubview(buttonsStackView)

    // autolayout
    verticalStackView.snp.makeConstraints { (maker) in
      maker.top.equalToSuperview().offset(self.layoutMargins.top)
      maker.leading.equalToSuperview().offset(self.layoutMargins.left)
      maker.trailing.equalToSuperview().offset(-self.layoutMargins.right)
    }

    buttonsStackView.snp.makeConstraints { (maker) in
      maker.top.equalTo(verticalStackView.snp.bottom).offset(30)
      maker.bottom.equalToSuperview().offset(-self.layoutMargins.bottom)
      maker.centerX.equalToSuperview()
    }
  }

  @objc func answerQuestion(_ sender: UIButton) {
    questionAnsweredCallback?()
  }

  private func updateQuiz() {
    if let quiz = self.quiz {
      self.questionLabel.text = quiz.question
      self.answerLabel.text = quiz.answer
    }

    self.answerLabel.isHidden = true
    self.buttonsStackView.isHidden = true
  }

  @objc func showAnswer(_ sender: Any) {
    print(#function)
    self.answerLabel.isHidden = false
    self.buttonsStackView.isHidden = false
  }
}

