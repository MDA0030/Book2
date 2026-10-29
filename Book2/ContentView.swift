//
//  ContentView.swift
//  Book2
//
//  Created by matt on 10/26/26.
//

import SwiftUI

struct ContentView: View {
    @State private var chosenBook: Book?
    @State private var toggleMystery = false
    @State private var showConfirmed = false
    
    //
    @State private var mysteryBook: Book?
    
    private var mysteryTotal: Double {
        guard let book = chosenBook else {return 0}
        return book.bookPrice + (toggleMystery ? Book.mysteryPrice:0)
    }
    
    private var confirmationText: String {
        guard let book = chosenBook else {return ""}
        
        
        var message = "Selected book: \(book.bookTitle)"
        
        if toggleMystery {
            if let mystery = mysteryBook {
                message += "\nMystery book: \(mystery.bookTitle)"
            }
        }
        message += "\nTotal: \(mysteryTotal.dollarCurrency)"
        return message
        
    }
    
    
    var body: some View {
        VStack(spacing:0) {
            header
            
            ScrollView {
                VStack(spacing:10) {
                    ForEach(Book.bookCatalog) {book in bookRow(book)
                            .onTapGesture {
                                chosenBook = book}
                    }
                }
                .padding(.horizontal)
            }
            checkoutBar
        }
        .alert("Order submitted", isPresented: $showConfirmed) {
            Button("OK") {
            }
        } message: {
            Text(confirmationText)
        }
    }
        
    
    private var header: some View {
        VStack(spacing:8) {
            //Logo
                Image(systemName: "purpleDragon")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                .font(.system(size: 36))
                .foregroundStyle(.white)
                .frame(width:72, height:72)
                .background(Image("purpleDragon"))
                .overlay(Circle().stroke(Color.purple.opacity(0.25), lineWidth:1))
            
            
            Text("The Lore and Myth Page")
                .font(.system(.title, design: .serif).bold())
            Text("Sci Fi Fantasy Book Store")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            }
            .padding(.vertical)
        }
    
    private func bookRow(_ book: Book) -> some View {
     
        return HStack {
            Image(systemName: book == chosenBook ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(book == chosenBook ? .purple: .secondary)
            Text(book.bookTitle)
                .font(.headline)
            Spacer()
            Text(book.bookPrice.dollarCurrency)
                .monospacedDigit()
        }
        .padding()
        .background (RoundedRectangle(cornerRadius: 12)
            .fill(book == chosenBook ? Color.purple.opacity(0.15) : Color(.secondarySystemBackground)))
        .contentShape(Rectangle())
        }
    
    private var checkoutBar: some View {
        VStack(spacing:12) {
            Toggle("Include a mystery 2nd book (\(Book.mysteryPrice.dollarCurrency))",
                   isOn: $toggleMystery
            )
                .disabled(chosenBook == nil)
            
            HStack {
                Text("Total")
                    .font(.title3.bold())
                Spacer()
                Text(mysteryTotal.dollarCurrency)
                    .font(.title3.bold())
                    .monospacedDigit()
            }
            
            Button("Submit your Order") {
                if toggleMystery {
                    mysteryBook = Book.mysteryBookBin.randomElement()
                } else {
                    mysteryBook = nil
                }
            
            showConfirmed = true
        }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                .controlSize(.large)
                .disabled(chosenBook == nil)
        }
        .padding()
        .background(.ultraThinMaterial)
        }
    }
    

#Preview {
    ContentView()
}
