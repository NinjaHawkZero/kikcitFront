


import Foundation

struct QuizResponse: Identifiable{
    var id = UUID()
    var quizResponder: QuizResponder
    
    var answers: [(String, String, [AnswerType])]
    
    var personaVariables: [String] {
        // 1 is the answer to the question
        // 2 is the Answer Type
        var array = [String]()
        array += answers.filter{ $0.2.contains(.personaVariable )
        }.map {$0.1}
        
        array += answers.filter{ $0.2.contains( .wordMatch)
        }.map {$0.1}
        
        return array
    }
    
    var incomeCues: [String] {
        // 1 is the answer to the question
        // 2 is the Answer Type
        return answers.filter{ $0.2.contains(.incomeCue)
        }.map {$0.1}
    }
    
    var color: String {
        // 1 is the answer to the question
        // 2 is the Answer Type
        return answers.filter{ $0.2.contains(.color)
        }.first!.1
    }
    
    var professionalJam: [String] {
       let results = answers.filter{ $0.2.contains(.professionalJam)
       }.first!.1.components(separatedBy: " + ")
        
        return results
    }
    
    
    

    var piScore: Float = 0.0  // Personal Interest
    var cpScore: Float = 0.0  // Consumer Propensity
    var eScore: Float = 0.0   // Engagement
    var ilScore: Float = 0.0  // Influences of Loyalty
    
    var compositeScore: Float {
        var newIL = ilScore
        if ilScore == 0 {
            newIL += 1.0
        }
            //Applying KikcIt Persona Variable Equation
        let compositeScore = (piScore * cpScore) + (eScore / newIL)
        print(compositeScore)
        return round(compositeScore * 1000) / 1000.0
    }
    
    var consumerCategory: BusinessCategory {
        switch compositeScore {
        case -16.0...(-8.945):
            // Art Avid
            return BusinessCategory.categories[5]
        case -8.944...(-1.89):
            //Big Business
            return BusinessCategory.categories[4]
        case -1.889...5.165:
            //Camo Cool
            return BusinessCategory.categories[3]
        case 5.166...12.22:
            //Local Love
            return BusinessCategory.categories[2]
        case 12.221...19.275:
            //Social Spark
            return BusinessCategory.categories[1]
        case 19.276...26.33:
            //Forward Fresh
            return BusinessCategory.categories[0]
        default:
            return BusinessCategory(name: "Unable to categorize", consumerPersona: "Sorry, not there :(", color: [], personaVariable: [], incomeCues: [], professionalJam: [])
        }
    }
    
    
    
    
    public static var placeholder = QuizResponse(quizResponder: .business, answers: [])

}

enum QuizResponder {
    case business,user
}
