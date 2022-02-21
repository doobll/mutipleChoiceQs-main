//
//  Question.swift
//  mutipleChoiceQs
//
//  Created by Judy chen on 2022/1/17.
//

import Foundation
import UIKit


struct Question{
    var topic: String
    var description: String
    var options: [String]
    var answer: String
    var example: String
    var image : String
}





struct ResultDetail{
    var rightAnswer: String!
    var answeredCount: Int! = 0
    var score: Int! = 0
    var time: String! 

    
}

var results = [ResultDetail(rightAnswer: "", answeredCount: 0, score: 0, time: "none")]



var questionData = [
    Question(topic: "數學",description: "average (a.)\n /ˈæv.ər.ɪdʒ/",
             options: ["平均的","正的","立方體的", "指數的"], answer: "平均的",
             example: "The average temparature is higher this year than last year.",
             image: "average"),
    Question(topic: "數學",description: "ellipse (n.)\n /iˈlɪps/",
             options: ["平行四邊形","菱形","橢圓" ,"梯形"] , answer: "橢圓",
             example: "The minimum and maximum ellipse margins are 1.5 and 2.5, respectively.",
             image: "ellipse"),
    Question(topic: "數學",description: "enumerate (v.)\n /ɪˈnjuː.mə.reɪt/",
             options: ["列舉","計算","等於","減去"], answer: "列舉",
             example: "A spokesperson enumerated the strikers' demands.", image: "enumerate"),
    Question(topic: "數學",description: "reckon (v.)\n /ˈrek.ən/",
             options: ["計算","圍住","求解","使對稱"], answer: "計算",
             example: "My pay is reckoned from the first day of the month.", image: "reckon"),
    Question(topic: "數學", description: "encircle (v.)\n /ɪnˈsɜː.kəl/",
             options: ["算帳","闡述","圍住","估計"], answer: "圍住",
             example: "Lines of latitude would encircle the globe parallel to the equator, while lines of longitude would encircle the globe through the poles.", image: "encircle"),
    Question(topic: "歷史", description: "extant (a.)\n /ekˈstænt/",
             options: ["現存的","神聖的","歷史性的","不現實的"], answer: "現存的",
             example: "We have some extant manuscripts from the 16th century.", image: "extant"),
    Question(topic: "歷史", description: "ego (n.)\n/ˈigo/",
             options: ["自我","崇拜","信徒","主教"], answer: "自我",
             example: "The greatest of them all are the least ego-pushing", image: "ego")
    ]





