//
//  CastChallenge.swift
//  DioCLT
//
//  Created by Giugliano Severo on 05/09/23.
//

import Foundation

func castChallengeMain() {
    if let entrada = readLine() {
        let partes = entrada.split(separator: ",")
        
        // TODO: Solicitar ao usuário que forneça os valores necessários para criar uma Transacao.
        
    }
}

func testCastChallengeMain() {
    let entrada = "01/02/2023,09:00:00,Deposito,100.00"
    let partes = entrada.split(separator: ",")
    
    let parte0 = partes[0]
    
    let transacao = Transacao(data: String(partes[0]) ,
                              hora: String(partes[1]),
                              descricao: String(partes[2]),
                              valor: Double(String(partes[3])) ?? 0.0)
    
    transacao.imprimir()
}


class Transacao {
    let data: String
    let hora: String
    let descricao: String
    let valor: Double

    init(data: String, hora: String, descricao: String, valor: Double) {
        self.data = data
        self.hora = hora
        self.descricao = descricao
        self.valor = valor
    }

    func imprimir() {
        print(descricao)
        print(data)
        print(hora)
        print(String(format: "%.2f", valor))
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

//01/02/2023,09:00:00,Deposito,100.00
//
//Deposito
//01/02/2023
//09:00:00
//100.00
