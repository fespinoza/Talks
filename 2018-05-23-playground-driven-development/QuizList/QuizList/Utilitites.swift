//
//  Utilitites.swift
//  QuizList
//
//  Created by Felipe Espinoza on 19/05/2018.
//  Copyright © 2018 Fespinozacast. All rights reserved.
//

import Foundation

@discardableResult
public func with<A>(_ value: A, configure: @escaping (A) -> Void) -> A {
  configure(value)
  return value
}
