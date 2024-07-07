import Foundation

struct Product: Identifiable, Codable, Hashable{
    var id = UUID()
    let name: String
    let photo: String
    let price: Double
}

extension Product {
    static func all() -> [Product] {
        
        return [
            Product(name: "Americano", photo: "☕️",  price: 4.00),
            Product(name: "Caramel Frappuccino", photo: "🥤", price: 6.00),
            Product(name: "Affogato", photo: "🍨",  price: 8.00),
            Product(name: "Sugar Donut", photo: "🍩", price: 4.50),
            Product(name: "Sugar Cream Pie", photo: "🍰", price: 6.50),
            Product(name: "Butter Croissant", photo: "🥟",  price: 3.50),
            Product(name: "Seafood Sandwich", photo: "🥪",  price: 6.00),
        ]
        
    }
}
