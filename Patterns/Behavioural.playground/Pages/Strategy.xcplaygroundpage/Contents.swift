//: [Previous](@previous)

/*
 The Strategy design pattern is a way to define a family of algorithms, encapsulate each one as an object, and make them interchangeable. This allows you to select the appropriate algorithm at runtime, based on the needs of your application.
 */

protocol PaymentStrategy {
    func pay(amount: Int)
}

class CreditCardPayment: PaymentStrategy {
    func pay(amount: Int) {
        print("Paying \(amount) with credit card")
    }
}

class PayPalPayment: PaymentStrategy {
    func pay(amount: Int) {
        print("Paying \(amount) with PayPal")
    }
}

class PaymentContext {
    private var _strategy: PaymentStrategy

    init(strategy: PaymentStrategy) {
        self._strategy = strategy
    }

    func changeStrategy(strategy: PaymentStrategy) {
        self._strategy = strategy
    }

    func executePayment(amount: Int) {
        _strategy.pay(amount: amount)
    }
}


let creditCardPayment = CreditCardPayment()
let paymentContext = PaymentContext(strategy: creditCardPayment)
paymentContext.executePayment(amount: 100)

let payPalPayment = PayPalPayment()
paymentContext.changeStrategy(strategy: payPalPayment)
paymentContext.executePayment(amount: 100)


//: [Next](@next)
