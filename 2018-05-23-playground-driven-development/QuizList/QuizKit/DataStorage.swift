//
//  DataStorage.swift
//  QuizList
//
//  Created by Felipe Espinoza on 18/03/2018.
//  Copyright © 2018 Fespinozacast. All rights reserved.
//

import Foundation

public struct Quiz {
  public let question: String
  public let answer: String
}

class DataStorage {
  var quizes: [Quiz] = []

  static func example() -> DataStorage {
    let dataStorage = DataStorage()
    dataStorage.quizes = [
      Quiz(question: "What's the capital of Chile?", answer: "Santiago"),
      Quiz(question: "Life and everything", answer: "42"),
      Quiz(question: "Who was the legendary Benedictine monk who invented champagne?", answer: "Dom Perignon"),
      Quiz(question: "Name the largest freshwater lake in the world?", answer: "Lake Superior"),
      Quiz(question: "Where would you find the Sea of Tranquility?", answer: "The Moon"),
      Quiz(question: "What is someone who shoes horses called?", answer: "A farrier"),
      Quiz(question: "What item of clothing was named after its Scottish inventor?", answer: "A Mackintosh"),
      Quiz(question: "What kind of weapon is a falchion?", answer: "A sword"),
      Quiz(question: "Which word goes before vest, beans and quartet?", answer: "String"),
      Quiz(question: "What is another word for lexicon?", answer: "Dictionary"),
      Quiz(question: "Name the seventh planet from the sun", answer: "Uranus"),
      Quiz(question: "Who invented the rabies vaccination?", answer: "Louis Pasteur"),
    ]
    return dataStorage
  }
}
