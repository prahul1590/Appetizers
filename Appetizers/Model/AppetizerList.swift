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
        name: "Test Appetizer 1",
        calories: 300,
        id: 1,
        description: "This perfectly thin cut just melts in your mouth.",
        protein: 14,
        carbs: 0,
        price: 8.99
    )
    
    static let sampleAppetizer1 = Appetizer(
        imageURL: URL(
            string: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg"
        )?.absoluteString ?? "-",
        name: "Test Appetizer 2",
        calories: 300,
        id: 2,
        description: "This perfectly thin cut just melts in your mouth.",
        protein: 14,
        carbs: 0,
        price: 8.99
    )
    
    
    
    static let sampleAppetizer2 = Appetizer(
        imageURL: URL(
            string: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg"
        )?.absoluteString ?? "-",
        name: "Test Appetizer 3",
        calories: 300,
        id: 3,
        description: "This perfectly thin cut just melts in your mouth.",
        protein: 14,
        carbs: 0,
        price: 8.99
    )
    
    
    
    static let appetizers = [sampleAppetizer,sampleAppetizer1,sampleAppetizer2]
}
