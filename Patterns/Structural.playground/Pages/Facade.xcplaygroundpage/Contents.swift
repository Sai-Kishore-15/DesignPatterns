//: [Previous](@previous)

class Subsystem1 {
    func operation1() {
        print("Subsystem1: Performing operation 1")
    }

    func operation2() {
        print("Subsystem1: Performing operation 2")
    }
}

class Subsystem2 {
    func operation1() {
        print("Subsystem2: Performing operation 1")
    }

    func operation2() {
        print("Subsystem2: Performing operation 2")
    }
}

class Facade {
    private var subsystem1: Subsystem1
    private var subsystem2: Subsystem2

    init(subsystem1: Subsystem1, subsystem2: Subsystem2) {
        self.subsystem1 = subsystem1
        self.subsystem2 = subsystem2
    }

    func operation() {
        print("Facade: Performing operation")
        subsystem1.operation1()
        subsystem2.operation1()
        subsystem1.operation2()
        subsystem2.operation2()
    }
}

let subsystem1 = Subsystem1()
let subsystem2 = Subsystem2()
let facade = Facade(subsystem1: subsystem1, subsystem2: subsystem2)
facade.operation()


//: [Next](@next)
