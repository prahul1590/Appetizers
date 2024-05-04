import Foundation

// MARK: - Appetizer
struct AppetizerList: Codable {
    let request: [Appetizer]
}

// MARK: - Request
struct Appetizer: Codable,Identifiable {
    let imageURL: String
    let name: String
    let calories, id: Int
    let description: String
    let protein, carbs: Int
    let price: Double
}


struct MockData{
    
    static let sampleAppetizer = Appetizer(
        imageURL: URL(
            string: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg"
        )?.absoluteString ?? "-",
        name: "Test Appetizer",
        calories: 300,
        id: 1,
        description: "This perfectly thin cut just melts in your mouth.",
        protein: 14,
        carbs: 0,
        price: 8.99
    )
    
    
    static let appetizers = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
}
