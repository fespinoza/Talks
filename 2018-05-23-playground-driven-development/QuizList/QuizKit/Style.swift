//
//  Style.swift
//  QuizKit
//
//  Created by Felipe Espinoza on 21/05/2018.
//  Copyright © 2018 Fespinozacast. All rights reserved.
//

import Foundation


public struct Style {
  public static let blueColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1.0)
  public static let backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 244/255, alpha: 1.0)

  public static func scopedImage(named: String) -> UIImage {
    let bundle = Bundle(for: DataStorage.self)
    guard let image = UIImage(named: named, in: bundle, compatibleWith: nil) else {
      preconditionFailure("❌ there was no image named: \(named) in the bundle")
    }

    return image
  }

  public static func questionLabelStyle(_ label: UILabel) {
    with(label) {
      $0.font = UIFont.preferredFont(forTextStyle: .title2)
      $0.textAlignment = .center
      $0.numberOfLines = 0
      $0.lineBreakMode = .byWordWrapping
    }
  }

  public static func roundedButton(_ view: UIView) {
    view.layer.cornerRadius = view.bounds.height / 2.0
  }

  public static func enableDynamicFont(_ label: UILabel?) {
    label?.adjustsFontForContentSizeCategory = true
  }
}
