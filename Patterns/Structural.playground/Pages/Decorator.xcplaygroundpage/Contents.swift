import UIKit

/*
 that allows you to add new behavior to existing objects dynamically. It is an alternative to subclassing, which allows you to extend the functionality of a class without modifying its code.
 */

protocol Component {
    func operation() -> String
}

class ConcreteComponent: Component {
    func operation() -> String {
        return "ConcreteComponent"
    }
}

class Decorator: Component {
    private var component: Component

    init(component: Component) {
        self.component = component
    }

    func operation() -> String {
        return component.operation()
    }
}

class ConcreteDecoratorA: Decorator {
    override func operation() -> String {
        return "ConcreteDecoratorA(\(super.operation()))"
    }
}

class ConcreteDecoratorB: Decorator {
    override func operation() -> String {
        return "ConcreteDecoratorB(\(super.operation()))"
    }
}

// Real world analogy - Meal ordering system
protocol Meal {
    func getCost() -> Double
    func getDescription() -> String
}

class BasicMeal: Meal {
    func getCost() -> Double {
        return 10.0
    }

    func getDescription() -> String {
        return "Basic meal"
    }
}

class MealDecorator: Meal {
    private var meal: Meal

    init(meal: Meal) {
        self.meal = meal
    }

    func getCost() -> Double {
        return meal.getCost()
    }

    func getDescription() -> String {
        return meal.getDescription()
    }
}

class ToppingDecorator: MealDecorator {
    private let topping: String
    private let cost: Double

    init(meal: Meal, topping: String, cost: Double) {
        self.topping = topping
        self.cost = cost
        super.init(meal: meal)
    }

    override func getCost() -> Double {
        return super.getCost() + cost
    }

    override func getDescription() -> String {
        return super.getDescription() + ", with \(topping)"
    }
}

class SideDecorator: MealDecorator {
    private let side: String
    private let cost: Double

    init(meal: Meal, side: String, cost: Double) {
        self.side = side
        self.cost = cost
        super.init(meal: meal)
    }

    override func getCost() -> Double {
        return super.getCost() + cost
    }

    override func getDescription() -> String {
        return super.getDescription() + ", with a side of \(side)"
    }
}
