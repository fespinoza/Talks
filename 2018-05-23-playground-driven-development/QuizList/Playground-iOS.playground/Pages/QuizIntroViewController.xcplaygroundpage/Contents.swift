import UIKit
import QuizKit

let quizViewController = QuizIntroViewController()

import PlaygroundSupport

PlaygroundPage.current.liveView = PlaygroundHelpers.preview(
  quizViewController,
  forDeviceType: .iphone8,
  orientation: .portrait,
  additionalTraits: [
  ]
)
