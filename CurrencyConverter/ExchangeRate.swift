//
//  ExchangeRate.swift
//  CurrencyConverter
//
//  Created by Philophobic on 03/10/24.
//

import SwiftUI

struct ExchangeRate: View {
    var leftImage : ImageResource
    var text : String
    let rightImage : ImageResource
    
    var body: some View {
        HStack {
            //Left image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height:33)
            
            
            //Excahnge rate text
            Text(text)
            
            //Right image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height:33)
            
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpenny, text: "1 Gold penny = 4 gold peace", rightImage: .goldpiece)
}
