//
//  IconGrid.swift
//  CurrencyConverter
//
//  Created by Philophobic on 03/10/24.
//

import SwiftUI

struct IconGrid: View {
    
    @State  var selectedCurrency : Currency

    var body: some View {
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){
            ForEach(Currency.allCases) { currency in
                if selectedCurrency == currency {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black,radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.3)
                        }
                } else  {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            selectedCurrency = currency
                        }
                }
            }
        }
    }
}

#Preview {
    IconGrid(selectedCurrency: .cooperPenny)
}
