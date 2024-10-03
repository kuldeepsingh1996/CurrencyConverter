//
//  SelectCurrency.swift
//  CurrencyConverter
//
//  Created by Philophobic on 03/10/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dimiss

    @State var topCurrency : Currency = .silverPenny
    @State var bottomCurrency  : Currency = .goldPenny
    var body: some View {
        ZStack {
            //Background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                Text("Select the currency you wanna start with:")
                    .fontWeight(.bold)
                IconGrid(selectedCurrency: topCurrency)
                //Text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(.bold)
                //Currency Icon
                
                IconGrid(selectedCurrency: bottomCurrency)

                //Done
                Button("Done") {
                    dimiss()
                }
                .tint(.white)
                .font(.largeTitle)
                .frame(width: 150)
                .background(.brown)
                
            }
            .multilineTextAlignment(.center)

            .padding()
        }
    }
}

#Preview {
    SelectCurrency()
}
