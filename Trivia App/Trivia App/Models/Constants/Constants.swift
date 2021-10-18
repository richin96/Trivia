//
//  Constants.swift
//  Trivia App
//
//  Created by MegaMind on 17/10/21.
//

import Foundation

enum SelectionType {
    case single, multiple
}

struct Strings {
    static let empty = ""
}

struct ContentStrings {
    
    static var summary: (_ userName: String, _ answer1: String, _ answer2: String) -> String = { userName, answer1, answer2 in
        return """
Hello \(userName),

Here are the answers selected:

Who is the best cricketer in the world?

Answer: \(answer1)

What are the colors in the national flag?

Answers : \(answer2)
"""
    }
    
    static var history: (_ no: Int, _ date: String, _ userName: String, _ answer1: String, _ answer2: String) -> String = { no, date, userName, answer1, answer2 in
        return """
GAME \(no) : \(date)

Name : \(userName)

Who is the best cricketer in the world?

Answer : \(answer1)

What are the colours in the national flag?

Answers : \(answer2)
"""
    }
}
