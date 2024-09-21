

import Foundation

struct Question: Identifiable {
    var id = UUID()
    let question: String
    let answers: [String]
    var answerType: [AnswerType] = []
    var answerScore: [Float] = [0]
    
    public static var businessQuestions = [
        Question(question: "What is your PRIMARY brand color?", answers: ["Blue","Yellow", "Red", "Orange", "Green", "Pink", "Brown", "Purple", "Black"], answerType: [.color]),
        Question(question: "Would your say your average consumer is:", answers: ["Modest", "Agile"], answerType: [.personaVariable]),
        Question(question: "Which verb works for your brand?", answers: ["Forward-Thinking", "Selective"], answerType: [.personaVariable]),
        Question(question:  "Which noun works for your brand?", answers: ["Servant Leader", "Headliner"], answerType: [.personaVariable]),
        Question(question: "Where would you put the average spend per customer per interaction?", answers:  ["Yay", "Midway", "Nay"], answerType: [.incomeCue]),
        Question(question: "Would you say your space caters to the:", answers: ["Health Focused", "Foodie"], answerType: [.personaVariable]),
        Question(question: "How long does the average customer stay per visit/interaction?", answers: ["Less than 45 minutes", "More than 45 minutes", "Both"], answerType: [.wordMatch]),
        Question(question:  "Which label would fit the aesthetic of your brand's space?", answers: ["Visually-Rich", "Music-Friendly", "Socially-Diverse"], answerType: [.personaVariable]),
        Question(question:  "What type of protein do your customers prefer?", answers:  ["Chicken", "Fish", "Beef", "Veggie-Friendly"], answerType: [.wordMatch]),
        Question(question: "Which career professional would make up your consumer base?", answers: ["Office", "Creative", "Food/Entertainment", "Creative + Food/Entertainment", "Office + Creative", "Food/Entertainment + Office"], answerType: [.professionalJam])
    ]
    
    public static var userQuestions: [Question] = [
    Question(question: "How long have you & your bestie been besties?", answers: [
        "High school",
        "College",
        "Meet @ work"
        ], answerType: [.IL], answerScore: [6,4,2]),
    Question(question: "Which is your favorite type of protein?", answers: [
        "Fish",
        "Chicken",
        "Beef",
        "Veggie-Friendly"], answerType: [.wordMatch], answerScore: [0,0,0,0]),
    
    Question(question: "How active are you on social media?", answers: [
        "Hardly Active",
        "Sort of Active",
        "Very Active"
        ], answerType: [.E], answerScore: [-2,1,2]),
                                

    Question(question: "Are you into long baths or quick showers?", answers: [
        "Quick Showers",
        "Long Baths",
        "Both"
        ], answerType: [.PI], answerScore: [0,0,0]),  // You may adjust the type here as needed

    Question(question: "Have you read a book in the last 21 days?", answers: [
        "Yes",
        "No",
        "I'm an article type of person"
        ], answerType: [.PI], answerScore: [1,-1,0.5]),

        //MARK: This question should have two different types
    Question(question: "Have you ever played organized sports?", answers: [
        "Yes",
        "No"
    ], answerType: [.IL, .E], answerScore: [2,1]),

    Question(question: "What is your preferred learning style?", answers: [
        "Hands-on",
        "Visual",
        "Listening"
        ], answerType: [.PI], answerScore: [2,3,1]),

    Question(question: "Which one of these customer elements is most important to you?", answers: [
        "Experience",
        "Familiarity",
        "Convenience"
        ], answerType: [.PI], answerScore: [4,2,-2]),

    Question(question: "What type of job do you have?", answers: [
        "Creative",
        "Food/Entertainment",
        "Office",
        "Other"
        ], answerType: [.E], answerScore: [2,1,3,0.5]),

    Question(question: "Do you budget your monthly spending?", answers: [
        "Yes",
        "No",
        "Sometimes"
        ], answerType: [.CP], answerScore: [2,-2,1])
    ]
    
    public static var quizQuestions: [Question] = []
}
