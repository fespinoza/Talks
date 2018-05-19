//
//  QuizCell.swift
//  QuizList
//
//  Created by Felipe Espinoza on 18/03/2018.
//  Copyright © 2018 Fespinozacast. All rights reserved.
//

import UIKit
import SnapKit

class QuizCell: UITableViewCell {
  // MARK: - Public properties

  // MARK: - Private properties
  let questionLabel: UILabel = {
    let questionLabel = UILabel()
    questionLabel.numberOfLines = 0
    questionLabel.lineBreakMode = .byWordWrapping

    return questionLabel
  }()

  // MARK: - Initializers
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  // MARK: - UITableViewCell overrides

  override var intrinsicContentSize: CGSize {
    return CGSize(
      width: questionLabel.intrinsicContentSize.width + 20*2,
      height: questionLabel.intrinsicContentSize.height + 10*2
    )
  }

  // MARK: - Private methods
  private func setup() {
    self.addSubview(questionLabel)

    questionLabel.snp.makeConstraints { (maker) in
      maker.margins.equalToSuperview().inset(UIEdgeInsetsMake(10, 20, 10, 20))
    }
  }
}
