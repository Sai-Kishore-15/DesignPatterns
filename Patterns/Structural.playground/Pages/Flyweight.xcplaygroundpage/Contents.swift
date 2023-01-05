//: [Previous](@previous)

/*
 reuse a large number of similar objects efficiently. It does this by storing the objects in a pool and maintaining a count of how many objects are in the pool. When a client requests an object, the Flyweight object checks if it already exists in the pool and returns it if it does. If it does not exist, the Flyweight object creates a new object and adds it to the pool.
 */

protocol Flyweight {
    func operation(extrinsicState: String) -> String
}

class ConcreteFlyweight: Flyweight {
    private let intrinsicState: String

    init(intrinsicState: String) {
        self.intrinsicState = intrinsicState
    }

    func operation(extrinsicState: String) -> String {
        return "Flyweight: ConcreteFlyweight with intrinsic state '\(intrinsicState)', and extrinsic state '\(extrinsicState)'"
    }
}

class FlyweightFactory {
    private var flyweights: [String: Flyweight] = [:]

    func flyweight(for key: String) -> Flyweight {
        if let flyweight = flyweights[key] {
            return flyweight
        }

        let flyweight = ConcreteFlyweight(intrinsicState: key)
        flyweights[key] = flyweight
        return flyweight
    }
}


//: [Next](@next)

// REal World

protocol Character {
    func draw(point: Point)
}

class ConcreteCharacter: Character {
    private let font: String
    private let color: String

    init(font: String, color: String) {
        self.font = font
        self.color = color
    }

    func draw(point: Point) {
        print("Drawing character '\(self)' with font '\(font)' and color '\(color)' at point (\(point.x), \(point.y))")
    }
}

class CharacterFactory {
    private var characters: [String: Character] = [:]

    func character(for code: String) -> Character {
        if let character = characters[code] {
            return character
        }

        let character: Character
        switch code {
        case "A":
            character = ConcreteCharacter(font: "Arial", color: "black")
        case "B":
            character = ConcreteCharacter(font: "Helvetica", color: "blue")
        default:
            character = ConcreteCharacter(font: "Times New Roman", color: "red")
        }
        characters[code] = character
        return character
    }
}

/*
 Looks like a red flag to me because
 - What if you change one character's colour, all characters will change colour
 - Very complex to understand and debug
 - Tightly coupled with the factory- cannot change them independently

 Internet answers
 Increased complexity: The Factory pattern introduces an additional level of abstraction, which can make the code more difficult to understand and maintain.
 Increased number of classes: The Factory pattern requires the creation of at least two additional classes: the factory class and the product class. This can increase the overall number of classes in the system, which can make the code more difficult to manage.
 Tight coupling between the factory and the product: The factory is responsible for creating the product, which can lead to tight coupling between the factory and the product. This can make it more difficult to change the product or the factory independently, as any changes to one may require changes to the other.
 Lack of flexibility: The Factory pattern can be inflexible if you need to create a wide variety of products with different characteristics. It may require the creation of many subclasses to support all of the different product variations, which can make the code more complex and harder to maintain.
 Lack of control: The Factory pattern hides the creation of the product from the client, which can make it difficult for the client to have control over the creation process. This can be a disadvantage if the client needs to customize the product in some way before it is used.
 =


 */
