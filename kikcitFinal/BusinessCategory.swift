

import Foundation


struct BusinessCategory {
    var name: String
    var consumerPersona: String
    var color: [String]
    var personaVariable: [String]
    var incomeCues: [String]
    var professionalJam: [String]
    
    var wordArray: [String] {
        return color + personaVariable + incomeCues + professionalJam
    }
    
    public static var categories: [BusinessCategory] = [
        BusinessCategory(name: "Forward Fresh", consumerPersona: "Forward Fresh.  A high level of impulsivity when it comes to spending. A strong desire to see the improvement of things. Their motivation comes from the ability to move with the latest trends. They digest the nitty-gritty of the world's happenings on a regular. Their loyalty as a consumer is directly connected to the social relevance of the purchase. The market is their compass.", color: ["Yellow", "Red", "Blue"], personaVariable: ["Headliner", "Agile", "Socially-Diverse", "Servant Leader", "Both","More than 45 minutes", "Less than 45 minutes", "Chicken"], incomeCues: ["Yay"], professionalJam: ["Office", "Creative"]),
        BusinessCategory(name: "Social Spark", consumerPersona: "Social Spark.  A medium to high level of impulsivity when it comes to spending. They thrive off of being the life of whatever social space they're a part of. Most of their purchases happen during non-work hours. Their loyalty as a consumer is connected to the experience versus the product/service. They spend in emotional spurts.", color: ["Orange","Green","Pink"], personaVariable: ["Social-Diverse", "Visually-Rich", "Music-Friendly", "Less than 45 minutes", "Chicken","Beef"], incomeCues: ["Midway"], professionalJam: ["Food/Entertainment"]),
        BusinessCategory(name: "Local Love", consumerPersona: "Local Love.  A medium level of impulsivity when it comes to spending. A strong love for community growth and togetherness. Their motivation comes from makingdiverse investments within their community ecosystem. They shop with big-box brands only on an \"NEED TI NOW\" basis. They look forward to frequenting spaces that have a happening community vibe.", color: ["Blue, Brown, Purple"], personaVariable: ["Modest", "Health-Focused", "Selective", "More than 45 minutes", "Veggie-Friendly"], incomeCues: ["Midway"], professionalJam: ["Creative", "Food/Entertainment"]),
        BusinessCategory(name: "Camo Cool", consumerPersona: "Camo Cool.  A medium-to-low impulsivity when it comes to spending. An active sense of confidence fuels consumer interactions. Their students of discipline, wisdom, and bigger-than-life aspirations.Their loyalty as a consumer sometimes wonders,but they are specific with their purchases. They have a knack for intuitiveness.They grind hard to save for the big/extreme purchases.", color: ["Yellow", "Green", "Grey"], personaVariable: ["Foodie", "Forward-Thinking", "Visually Rich", "More than 45 minutes", "Fish"], incomeCues: ["Midway"], professionalJam: ["Creative"]),
        BusinessCategory(name: "Big Business", consumerPersona: "Big Business.  A low level of impulsivity when it comes to spending. A hunger to build and build more. Their grind is focused on a sense of power and security. Their loyalty as a consumer is rigid and anally consistent. They are charged by the favorable trends in the market. Most of their purchases would fall under the \"business necessity\" category. They frequent spaces that cater to the ambiance they've created professionally.", color: ["Black", "Blue","Red"], personaVariable: ["Modest", "Selective", "Headliner", "Agile", "Both","More than 45 minutes","Less than 45 minutes", "Fish", "Beef"], incomeCues: ["Nay"], professionalJam: ["Office"]),
        BusinessCategory(name: "Art Avid", consumerPersona: "Art Avid.  A super-low level of impulsivity when it comes to spending. They thrive off of being the conscious mind. They're mindful of making sure they color their environment how they feel. Beauty is in the simple things. Most of their interactions have some connection to art.", color: ["Green", "Brown", "Purple"], personaVariable: ["Visually-Rich", "Selective", "Music-Friendly", "Health-Focused", "More than 45 minutes","Fish", "Veggie-Friendly"], incomeCues: ["Nay"], professionalJam: ["Creative", "Food/Entertainment"])
        
    ]
}
