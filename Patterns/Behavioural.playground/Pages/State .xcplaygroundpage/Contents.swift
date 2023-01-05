//: [Previous](@previous)

import Foundation

/*
 The State design pattern is a behavioral design pattern that allows an object to alter its behavior when its internal state changes. This pattern is used to provide a clean way to separate different states an object may have and the actions that should be taken in each state.

 In the empty state, the shopping cart cannot be checked out. If the user tries to check out, an error message is displayed. In the non-empty state, the user can add or remove items from the cart and also check out. Once the cart is checked out, the user can no longer make any changes to the cart and an order confirmation is displayed.
 */

protocol State {
    func addItem()
    func removeItem()
    func checkOut()
}

class ShoppingCart {
    private var state: State

    init(state: State) {
        self.state = state
    }

    func setState(state: State) {
        self.state = state
    }

    func addItem() {
        state.addItem()
    }

    func removeItem() {
        state.removeItem()
    }

    func checkOut() {
        state.checkOut()
    }
}

class EmptyState: State {
    func addItem() {
        print("Added item to cart")
        setState(state: NonEmptyState())
    }

    func removeItem() {
        print("Cannot remove item from empty cart")
    }

    func checkOut() {
        print("Cannot check out an empty cart")
    }
}

class NonEmptyState: State {
    func addItem() {
        print("Added item to cart")
    }

    func removeItem() {
        print("Removed item from cart")
    }

    func checkOut() {
        print("Checking out...")
        setState(state: CheckedOutState())
    }
}

class CheckedOutState: State {
    func addItem() {
        print("Cannot add item to checked out cart")
    }

    func removeItem() {
        print("Cannot remove item from checked out cart")
    }

    func checkOut() {
        print("Cannot check out a cart that has already been checked out")
    }
}



//: [Next](@next)
