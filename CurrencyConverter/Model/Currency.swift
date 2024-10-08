//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Philophobic on 03/10/24.
//

import SwiftUI


enum Currency : Double , CaseIterable , Identifiable {
    case cooperPenny = 6400
    case silverPenny = 64
    case silverPeace = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: Currency {
        self
    }
    var image : ImageResource {
        
        switch self {
        case .cooperPenny :
                .copperpenny
        case .silverPenny :
                .silverpenny
        case .silverPeace :
                .silverpiece
        case .goldPenny :
                .goldpenny
        case .goldPiece :
                .goldpiece
            
        }
    }
    
    
    var name  : String {
        switch self {
            
        case .cooperPenny :
             "Copper Penny"
        case .silverPenny :
                "Silver Penny"
        case .silverPeace :
                "Silver Piece"
        case .goldPenny :
                "Gold Penny"
        case .goldPiece :
                "Gold Piece"
        }
    }
    
    
    func convert(amountString:String,currency:Currency) -> String {
        guard let doubleAmount = Double(amountString) else  {
            return ""
        }
        let convertAmount = (doubleAmount / self.rawValue) * currency.rawValue
        return String(format: "%.2f", convertAmount)
    }
}

