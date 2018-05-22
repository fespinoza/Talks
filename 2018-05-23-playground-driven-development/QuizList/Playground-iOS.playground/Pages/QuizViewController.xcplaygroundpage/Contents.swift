import UIKit
import SnapKit
import QuizKit

class QuizViewController: UIViewController {
  var dataStorage = DataStorage.example() {
    didSet {
      updateView()
    }
  }
  var currentQuestionIndex: Int = 0 {
    didSet {
      updateView()
    }
  }
  var currentQuestion: Quiz {
    return dataStorage.quizes[currentQuestionIndex]
  }
  var state: State = .question {
    didSet {
      updateView()
    }
  }

  enum State {
    case question
    case answer
  }

  let showAnswerButton = UIButton()
  let questionIndexLabel = UILabel()
  let questionLabel = UILabel()
  let answerLabel = UILabel()
  let correctAnswerButton = UIButton()
  let wrongAnswerButton = UIButton()
  let answerButtonStackView = UIStackView()

  override func viewDidLoad() {
    with(view) {
      $0.backgroundColor = Style.backgroundColor
    }

    with(questionIndexLabel) {
      $0.font = UIFont.preferredFont(forTextStyle: .body)
      $0.text = "../.."
      $0.textColor = Style.blueColor
    }

    let questionView = with(UIView()) {
      $0.backgroundColor = .white
      $0.layer.cornerRadius = 30
      $0.addGestureRecognizer(
        UITapGestureRecognizer(target: self, action: #selector(self.showAnswer(_:)))
      )
    }

    with(questionLabel) {
      $0.textColor = .gray
      $0.text = "...?"
    }
    with(questionLabel, configure: Style.questionLabelStyle)

    with(answerLabel) {
      $0.textColor = .black
      $0.text = "...!"
    }
    with(answerLabel, configure: Style.questionLabelStyle)

    let questionStackView = with(UIStackView()) {
      $0.axis = .vertical
      $0.alignment = .center
      $0.spacing = 25
      $0.distribution = .equalSpacing
    }

    with(showAnswerButton) {
      $0.setTitle("See the answer", for: .normal)
      $0.backgroundColor = Style.blueColor
      $0.contentEdgeInsets = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
      $0.addTarget(self, action: #selector(self.showAnswer(_:)), for: .touchUpInside)
    }

    let answerButtonStyle: (UIColor, UIImage?) -> (UIButton) -> Void = { (color, image) in
      return {
        $0.setImage(image, for: .normal)
        $0.backgroundColor = color
        $0.contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        $0.addTarget(self, action: #selector(self.showNextQuestion(_:)), for: .touchUpInside)
      }
    }

    with(
      correctAnswerButton,
      configure: answerButtonStyle(
        UIColor(red: 81/255, green: 174/255, blue: 33/255, alpha: 1.0),
        Style.scopedImage(named: "Right Symbol")
      )
    )

    with(
      wrongAnswerButton,
      configure: answerButtonStyle(
        UIColor(red: 205/255, green: 72/255, blue: 72/255, alpha: 1.0),
        Style.scopedImage(named: "Wrong Symbol")
      )
    )

    with(answerButtonStackView) {
      $0.axis = .horizontal
      $0.distribution = .fillEqually
      $0.spacing = 19
    }

    let closeButton = with(UIButton()) {
      $0.addTarget(self, action: #selector(self.close(_:)), for: .touchUpInside)
      $0.setImage(Style.scopedImage(named: "Close Icon"), for: .normal)
    }

    // subviews

    questionView.addSubview(questionStackView)

    view.addSubviews(
      questionIndexLabel,
      closeButton,
      questionView,
      showAnswerButton,
      answerButtonStackView
    )

    questionStackView.addArrangedSubviews(
      questionLabel,
      answerLabel
    )

    answerButtonStackView.addArrangedSubviews(
      correctAnswerButton,
      wrongAnswerButton
    )

    // autolayout

    questionStackView.snp.makeConstraints({ $0.edges.equalToSuperview().inset(30) })

    correctAnswerButton.snp.makeConstraints({
      $0.height.equalTo(wrongAnswerButton)
    })

    answerButtonStackView.snp.makeConstraints({
      $0.top.equalTo(questionView.snp.bottom).offset(25)
      $0.leading.equalToSuperview().inset(20)
      $0.trailing.equalToSuperview().inset(20)
      $0.height.equalTo(wrongAnswerButton)
    })

    questionView.snp.makeConstraints({
      $0.leading.equalToSuperview().inset(20)
      $0.trailing.equalToSuperview().inset(20)
      $0.centerY.equalToSuperview()
      $0.height.greaterThanOrEqualTo(150)
    })

    questionIndexLabel.snp.makeConstraints({
      $0.top.equalToSuperview().inset(20)
      $0.leading.equalToSuperview().inset(20)
    })

    closeButton.snp.makeConstraints({
      $0.top.equalToSuperview().inset(20)
      $0.trailing.equalToSuperview().inset(20)
    })

    showAnswerButton.snp.makeConstraints({
      $0.top.equalTo(questionView.snp.bottom).offset(25)
      $0.centerX.equalToSuperview()
    })

    updateView()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    with(showAnswerButton, configure: Style.roundedButton)
    with(correctAnswerButton, configure: Style.roundedButton)
    with(wrongAnswerButton, configure: Style.roundedButton)


    with(questionLabel, configure: Style.enableDynamicFont)
    with(answerLabel, configure: Style.enableDynamicFont)
    with(questionIndexLabel, configure: Style.enableDynamicFont)
    with(showAnswerButton.titleLabel, configure: Style.enableDynamicFont)
  }

  @objc func close(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }

  @objc func showAnswer(_ sender: Any?) {
    guard state == .question else {
      return
    }
    state = .answer
  }

  @objc func showNextQuestion(_ sender: UIButton) {
    state = .question
    guard currentQuestionIndex + 1 < dataStorage.quizes.count else {
      currentQuestionIndex = 0
      return
    }
    currentQuestionIndex += 1
  }

  private func updateView() {
    with(questionLabel) { $0.text = self.currentQuestion.question }
    with(answerLabel) { $0.text = self.currentQuestion.answer }

    with(questionIndexLabel) {
      $0.text = "\(self.currentQuestionIndex + 1)/\(self.dataStorage.quizes.count)"
    }

    switch state {
    case .question:
      answerButtonStackView.isHidden = true
      showAnswerButton.isHidden = false
      answerLabel.isHidden = true
    case .answer:
      answerButtonStackView.isHidden = false
      showAnswerButton.isHidden = true
      answerLabel.isHidden = false
    }
  }
}

let quizViewController = QuizViewController()

import PlaygroundSupport

PlaygroundPage.current.liveView = PlaygroundHelpers.preview(
  quizViewController,
  forDeviceType: .iphone8,
  orientation: .portrait,
  additionalTraits: [
//    UITraitCollection.init(layoutDirection: .rightToLeft),
//    UITraitCollection.init(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge),
  ]
)
