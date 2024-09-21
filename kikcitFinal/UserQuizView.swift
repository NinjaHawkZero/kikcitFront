


import SwiftUI

struct UserQuizView: View {
    @EnvironmentObject var user: userRegisterVM
    @State var question: String = Question.businessQuestions.first!.question
    @State var questions = Question.userQuestions
    @State private var quizResponse = QuizResponse.placeholder
    @State private var questionIndex = 0
    @State private var scoreIndex = 0
    @State var selectedAnswer: String = ""
    @State var selectedAnswerScore: Float = 0
    @State var consumerCategory: BusinessCategory = BusinessCategory.categories[0]
    @State private var lastQuestion = false
    @State private var quizDone = false
    @State private var AnswerTuple: (String, String, [AnswerType]) = ("", "",[])
    @State var piScore: Float = 0.0  // Personal Interest
    @State var cpScore: Float = 0.0  // Consumer Propensity
    @State var eScore: Float = 0.0   // Engagement
    @State var ilScore: Float = 0.0  // Influences of Loyalty
    @State var answeredQuestions: [(String , String, [AnswerType])] = []
    var body: some View {
        
        if user.didCompleteQuiz == false {
            
            
            if quizDone {
               
                
                userSubmission()
                
            }
            else {
                VStack {
                    Image(.kikcit)
                        .font(.system(size: 60))
                        .padding()
                    
                    Text(question)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    List{
                        VStack(alignment: .leading){
                            ForEach(Array(questions[questionIndex].answers.enumerated()), id: \.1) { index, answer in
                                
                                Button {
                                    selectAnswer(answer: answer)
                                    scoreIndex = index
                                    
                                } label: {
                                    HStack {
                                        Image(systemName: (selectedAnswer == answer) ? "checkmark.circle" : "circle")
                                        Text(answer)
                                    }
                                    
                                }.buttonStyle(SelectionButtonStyle())
                            }
                        }
                    }.scrollContentBackground(.hidden)
                    
                    Spacer()
                    
                    Button(lastQuestion ? "Submit" : "Next Question") {
                        if lastQuestion {
                            addScores(types: questions[questionIndex].answerType, index: scoreIndex)
                            finalSubmission()
                        } else {
                            addScores(types: questions[questionIndex].answerType, index: scoreIndex)
                            submitQuestion()
                        }
                        
                    }.buttonStyle(NextButtonStyle(isDisabled: selectedAnswer.isEmpty ))
                        .disabled(selectedAnswer.isEmpty)
                }
                .padding()
            }
        }
        
        else {
            
            MainView()
        }
        
        
        
    }
    func selectAnswer(answer: String){
        selectedAnswer = answer
        AnswerTuple = (question, selectedAnswer, questions[questionIndex].answerType)
    }
    
    //Adds scores for answer types, and consumer algorithm
    func addScores(types: [AnswerType], index: Int) {
        for type in types{
            switch type {
            case .color:
                fallthrough
            case .personaVariable:
                fallthrough
            case .incomeCue:
                fallthrough
            case .professionalJam:
                fallthrough
            case .wordMatch:
                piScore += 0
            case .PI:
                piScore += questions[questionIndex].answerScore[index]
                print("pi:\(piScore.description)")
            case .CP:
                cpScore += questions[questionIndex].answerScore[index]
                print("cp:\(cpScore.description)")
            case .E:
                eScore += questions[questionIndex].answerScore[index]
                print("E:\(eScore.description)")
            case .IL:
                ilScore += questions[questionIndex].answerScore[index]
                print("il:\(ilScore.description)")
                
            }
        }
    }
    
    func submitQuestion() {
        guard questionIndex < questions.count else {
            questionIndex = 0
            return
        }
        
        answeredQuestions.append(AnswerTuple)
        selectedAnswer = ""
        questionIndex += 1
        question = questions[questionIndex].question
        
        if questionIndex == questions.count - 1 {
            lastQuestion = true
        }
    }
    
    func finalSubmission() {
        
        
        quizDone = true
        
        answeredQuestions.append(AnswerTuple)
        
        quizResponse = QuizResponse(quizResponder: .business, answers: answeredQuestions, piScore: piScore, cpScore: cpScore, eScore: eScore, ilScore: ilScore)
        
        user.consumerPersona = quizResponse.consumerCategory.consumerPersona
        user.consumerCategory = quizResponse.consumerCategory.name
        
    }
}

#Preview {
    UserQuizView()
        .environmentObject(userRegisterVM())
}
