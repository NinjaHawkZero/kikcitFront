


import SwiftUI

struct BusinessQuizView: View {
    @EnvironmentObject var createBusinessVM: CreateBusinessVM
    @State var businessID = defaults.string(forKey: "businessID")
    @State var question: String = Question.businessQuestions.first!.question
    @State var questions = Question.businessQuestions
    @State private var quizResponse = QuizResponse.placeholder
    @State private var questionIndex = 0
    @State var selectedAnswer: String = ""
    @State private var businessUserPersona = ""
    @State private var lastQuestion = false
    @State private var quizDone = false
    @State private var AnswerTuple: (String , String, [AnswerType]) = ("", "", [])
    @State var answeredQuestions: [(String , String, [AnswerType])] = []
    
    
  
    
    var body: some View {
        
    
        
        
        if businessID == nil || businessID == "" || businessID == Optional("") {
            
            
            if quizDone {
                
                Text("Congrats! Your optimal client persona is:")
                    .font(.headline)
                Text(createBusinessVM.consumerCategory)
                    .bold()
                    .font(.title)
                
                businessOnboarding()
                
                
                
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
                            ForEach(questions[questionIndex].answers, id: \.self) { answer in
                                
                                Button {
                                    selectAnswer(answer: answer)
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
                            finalSubmission()
                        } else {
                            submitQuestion()
                        }
                        
                    }.buttonStyle(NextButtonStyle(isDisabled: selectedAnswer.isEmpty ))
                        .disabled(selectedAnswer.isEmpty)
                }
                .padding()
            }
        }
        
        
        else {
            
            
            BusinessViewAfterOnboard()
           
            
        }
        
        
        
    }
    
    func selectAnswer(answer: String){
        selectedAnswer = answer
        AnswerTuple = (question, selectedAnswer, questions[questionIndex].answerType)
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
        
        quizResponse = QuizResponse(quizResponder: .business, answers: answeredQuestions)
        
        createBusinessVM.consumerCategory = ConsumerCategory(color: quizResponse.color, personaVariables: quizResponse.personaVariables, incomeCues: quizResponse.incomeCues, professionalJam: quizResponse.professionalJam)
        
        
        
    }
    
    
    func ConsumerCategory(color: String, personaVariables: [String], incomeCues: [String], professionalJam: [String] ) -> String {
        var categoryDictionary: [String : Double] = [:]
        var responseArray = (quizResponse.incomeCues + quizResponse.professionalJam + quizResponse.personaVariables)
        responseArray.append(quizResponse.color)
        let responseSet = Set(responseArray)
        
        for category in
            BusinessCategory.categories {
            let categorySet = Set(category.wordArray)

            categoryDictionary[category.name] = Double(responseSet.intersection(categorySet).count) / 11.0
            
        }
       
        
        return categoryDictionary.max(by: {$0.value < $1.value})?.key ?? ""
    }
    
    
    
    
 
    
    

}

#Preview {
    BusinessQuizView()
        .environmentObject(CreateBusinessVM())
}
