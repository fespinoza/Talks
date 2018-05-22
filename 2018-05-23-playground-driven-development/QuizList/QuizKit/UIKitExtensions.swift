//
//  UIKitExtensions.swift
//  QuizKit
//
//  Created by Felipe Espinoza on 21/05/2018.
//  Copyright © 2018 Fespinozacast. All rights reserved.
//

import UIKit

public extension UIView {
  public func addSubviews(_ views: UIView...) {
    views.forEach({
      $0.translatesAutoresizingMaskIntoConstraints = false
      self.addSubview($0)
    })
  }
}

public extension UIStackView {
  public func addArrangedSubviews(_ views: UIView...) {
    views.forEach({
      $0.translatesAutoresizingMaskIntoConstraints = false
      self.addArrangedSubview($0)
    })
  }

  public func enableDebugBackground(withColor color: UIColor = .red) {
    let background = UIView()
    background.backgroundColor = color
    background.translatesAutoresizingMaskIntoConstraints = false

    self.addSubview(background)

    NSLayoutConstraint.activate([
      background.topAnchor.constraint(equalTo: self.topAnchor),
      background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    ])
  }
}
