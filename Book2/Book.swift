//
//  Book.swift
//  Book2
//
//  Created by matt on 10/26/26.
//

import Foundation

struct Book: Identifiable, Equatable {
    let id = UUID()
    let bookTitle: String
    let isbn: String
    let bookPrice: Double
}



extension Book {
    static let bookCatalog: [Book] = [
        Book(bookTitle: "War and Peace",   isbn: "978-00124784", bookPrice: 12.99),
        Book(bookTitle: "Brave New World",   isbn: "978-0060850524", bookPrice: 27.50),
        Book(bookTitle: "End and the Death",   isbn: "978-0040240321", bookPrice: 17.99),
        Book(bookTitle: "Finance 101",   isbn: "978-0010432509", bookPrice: 32.01),
        Book(bookTitle: "The Horus Heresy",   isbn: "978-0020638998", bookPrice: 17.01),
        Book(bookTitle: "The Flight of the Eisenstein: Collector's Edition",   isbn: "978-0023568519", bookPrice: 34.55),
        Book(bookTitle: "History of Zelda",   isbn: "978-0024538850", bookPrice: 34.99),
        Book(bookTitle: "Where the Wild Things Are",   isbn: "978-0030412208", bookPrice: 12.99),
        Book(bookTitle: "Art of Marvel",   isbn: "978-0016032709", bookPrice: 39.05)]
    
    
    
    //mystery price feature for a 2nd book
    static let mysteryPrice = 9.99
    
    static let mysteryBookBin: [Book] = [
        Book(bookTitle: "The Collapsing Empire",   isbn: "978-00133457", bookPrice: 9.99),
        Book(bookTitle: "A Wise Man's Fear",   isbn: "978-0066732", bookPrice: 9.99),
        Book(bookTitle: "Foundation",   isbn: "978-00455678", bookPrice: 9.99),
        Book(bookTitle: "Dune",   isbn: "978-00105781", bookPrice: 9.99),
        Book(bookTitle: "Nueromancer",   isbn: "978-0020638998", bookPrice: 9.99),
        Book(bookTitle: "The Time Machine",   isbn: "978-0023568576", bookPrice: 9.99),
        Book(bookTitle: "A Memory of Light",   isbn: "978-0024528867", bookPrice: 9.99),
        Book(bookTitle: "Ender's Game",   isbn: "978-0030413231", bookPrice: 9.99),
        Book(bookTitle: "Do Androids Dream of Electric Sheep",   isbn: "978-00167539", bookPrice: 9.99)]
}

extension Double {
    var dollarCurrency: String {
        formatted(.currency(code: "U.S. Dollars"))
    }
}




