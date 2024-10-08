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
    @FocusState var leftTyping
    @FocusState var rightTyping
    
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
                            .focused($leftTyping)
                            .multilineTextAlignment(.leading)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftAmount) { oldValue, newValue in
                                if leftTyping {
                                    rightAmount = leftCurrency.convert(amountString: leftAmount, currency: rightCurrency)
                                }
                            }
                    }

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
                            .focused($rightTyping)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightAmount) { oldValue, newValue in
                                if rightTyping {
                                    leftAmount = rightCurrency.convert(amountString: rightAmount, currency: leftCurrency)
                                }
                            }
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
        
        .onChange(of: leftCurrency, { oldValue, newValue in
            leftAmount = rightCurrency.convert(amountString: rightAmount, currency: leftCurrency)

        })
        
        .onChange(of: rightCurrency, { oldValue, newValue in
            rightAmount = leftCurrency.convert(amountString: leftAmount, currency: rightCurrency)
        })
        .sheet(isPresented: $showSelectedCurrency, content: {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        })
    }
}

#Preview {
    ContentView()
}
