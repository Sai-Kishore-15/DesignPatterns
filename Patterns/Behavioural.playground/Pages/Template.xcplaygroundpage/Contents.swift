//: [Previous](@previous)

/*
 The Template Method design pattern is a way to define the steps of an algorithm and allow subclasses to provide the implementation for one or more of those steps.
 */

protocol Document {
    func printHeader()
    func printBody()
    func printFooter()
    func printDocument()
}

extension Document {
    func printDocument() {
        printHeader()
        printBody()
        printFooter()
    }
}

class Invoice: Document {
    func printHeader() {
        print("Invoice Header")
    }

    func printBody() {
        print("Invoice Body")
    }

    func printFooter() {
        print("Invoice Footer")
    }
}

class Report: Document {
    func printHeader() {
        print("Report Header")
    }

    func printBody() {
        print("Report Body")
    }

    func printFooter() {
        print("Report Footer")
    }
}
let invoice = Invoice()
invoice.printDocument()


//: [Next](@next)
