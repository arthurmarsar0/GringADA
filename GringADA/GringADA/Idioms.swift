//
//  Idioms.swift
//  GringADA
//
//  Created by Arthur Alves Marsaro on 17/05/24.
//

import Foundation

enum Idioms: String, CaseIterable {
    case portugues = "Português", ingles = "Inglês", japones = "Japonês", outros = "Outros"
    
    func addCompatibility() -> Int{
        let result: Int
        let k: Int
        switch self {
            case .portugues:
                k = 1
            case .japones:
                k = 2
            case .ingles:
                k = 3
            default:
                k = 0
        }
        
        result = 10 * k
        return result
    }
}
