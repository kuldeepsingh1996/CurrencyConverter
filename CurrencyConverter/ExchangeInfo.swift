//
//  ExchangeInfo.swift
//  CurrencyConverter
//
//  Created by Philophobic on 01/10/24.
//

import SwiftUI

struct ExchangeInfo: View {
    
    @Environment(\.dismiss) var dimiss
    var body: some View {
        ZStack {
            //Background Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                //Image Text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                //Description text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates")
                    .font(.title2)
                    .padding()
                
                
                
                //Exchange Rates
                ExchangeRate(leftImage: .goldpiece, text: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
                ExchangeRate(leftImage: .goldpenny, text: "1 Gold Piece = 4 Silver Pieces", rightImage: .silverpiece)
                ExchangeRate(leftImage: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
                ExchangeRate(leftImage: .silverpenny, text: "1 Silver Piece = 100 Cooper Pennies", rightImage: .copperpenny)

                


                //Done button
                Button("Done") {
                    dimiss()
                }
                .tint(.white)
                .font(.largeTitle)
                .frame(width: 150)
                .background(.brown)
                
            }
        }
    }
}

#Preview {
    ExchangeInfo()
}


