//
//  ContentView.swift
//  kikcitFinal
//
//  Created by Marcus Westbrooks on 9/13/24.
//




import SwiftUI

struct ContentView: View {
    @State private var isInQuiz = false
    @State private var quizType = QuizResponder.user
    
    var body: some View {
        if isInQuiz {
            switch quizType {
            case .user:
                UserQuizView(question: Question.userQuestions.first!.question, questions: Question.userQuestions)
            case .business:
                BusinessQuizView(question: Question.businessQuestions.first!.question, questions: Question.businessQuestions)
            }
        }
        else {
            Text("Are you a user or a business?")
            
            Button("User") {
                quizType = .user
                isInQuiz = true
                
            }.buttonStyle(NextButtonStyle(isDisabled: false))
            
            Button("Business") {
                quizType = .business
                isInQuiz = true
            }.buttonStyle(NextButtonStyle(isDisabled: false))
            
        }
        
    }
        
    }
    
    #Preview {
        ContentView()
    }
