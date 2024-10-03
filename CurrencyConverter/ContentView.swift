//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Philophobic on 01/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showExchangeView = false
    @State private var showSelectedCurrency = false
    @State private var leftAmount = ""
    @State private var rightAmount = ""
    
    @State var leftCurrency : Currency = .silverPeace
    @State var rightCurrency : Currency = .goldPiece
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height:200)
                Text("Currency Exchnage")
                    .font(.title2)
                    .foregroundStyle(.white)
                HStack {
                    VStack {
                        HStack {
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height:33)
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectedCurrency.toggle()
                        }
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                    }
//                    Equak sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    VStack {
                        HStack {
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height:33)
                        }
                        .padding(.bottom,-5)
                        .onTapGesture {
                            showSelectedCurrency.toggle()
                        }
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .frame(height:200)
                .clipShape(.capsule)
                Spacer()
                //Info button
                HStack {
                    Spacer()
                    Button {
                        showExchangeView.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    
                }
            }
        }
        .sheet(isPresented: $showExchangeView, content: {
            ExchangeInfo()
        })
        
        .sheet(isPresented: $showSelectedCurrency, content: {
            SelectCurrency()
        })
    }
}

#Preview {
    ContentView()
}
