//: [Previous](@previous)

import Foundation

/*
 turns a request into a standalone object that contains all information about the request. This transformation lets you pass requests as method arguments, delay or queue a request's execution, and support undoable operations.
 */
protocol Command {
    func execute()
}

class Light {
    func turnOn() {
        print("Turning on light")
    }

    func turnOff() {
        print("Turning off light")
    }
}

class TurnOnLightCommand: Command {
    private var light: Light

    init(light: Light) {
        self.light = light
    }

    func execute() {
        light.turnOn()
    }
}

class TurnOffLightCommand: Command {
    private var light: Light

    init(light: Light) {
        self.light = light
    }

    func execute() {
        light.turnOff()
    }
}

class RemoteControl {
    private var onCommand: Command
    private var offCommand: Command

    init(onCommand: Command, offCommand: Command) {
        self.onCommand = onCommand
        self.offCommand = offCommand
    }

    func pressOnButton() {
        onCommand.execute()
    }

    func pressOffButton() {
        offCommand.execute()
    }
}


/*
 It decouples the sender of a request (the remote control) from the receiver of the request (the light). The remote control does not need to know how to perform the action of turning the light on or off, it simply needs to know how to execute the command. This separation of concerns makes the system more modular and easier to maintain.
 It allows you to parametrize objects with operations. You can pass different command objects to the remote control and it will be able to perform different actions without having to change its own code.
 It provides support for undoable operations. By adding an undo() method to the Command protocol and storing a history of executed commands, you can implement undo functionality in your system.
 It allows you to queue requests or execute them concurrently. You can store a list of command objects and execute them at a later time, or you can execute them concurrently by using multiple threads.
 It promotes the Single Responsibility Principle. By separating the logic for executing a request into its own class (the command), you can ensure that each class has a single, well-defined responsibility. This makes the system more maintainable and easier to understand.
 */

//: [Next](@next)
