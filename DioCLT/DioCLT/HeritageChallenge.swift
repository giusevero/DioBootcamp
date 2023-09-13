//
//  HeritageChallenge.swift
//  DioCLT
//
//  Created by Giugliano Severo on 05/09/23.
//

import Foundation

class ContaBancaria {
    var nomeTitular: String
    var numeroConta: Int
    var saldo: Double
    
    init(numeroConta: Int, nomeTitular: String, saldo: Double) {
        self.numeroConta = numeroConta
        self.nomeTitular = nomeTitular
        self.saldo = saldo
    }
    
    func exibirInformacoes() {
        print("\(nomeTitular)")
        print("\(numeroConta)")
        print("Saldo: R$ \(String(format: "%.1f", saldo))")
    }
}

class ContaPoupanca: ContaBancaria {
    var taxaJuros: Double
    
    init(numeroConta: Int,
         nomeTitular: String,
         saldo: Double,
         taxaJuros: Double) {
        // TODO: Implementar adequadamente esta sobrecarga de construtores
        self.taxaJuros = taxaJuros
        super.init(numeroConta: numeroConta,
                   nomeTitular: nomeTitular,
                   saldo: saldo)
        
    }
    
    override func exibirInformacoes() {
        super.exibirInformacoes()
        //TODO: Complementar as informações com a taxa de juros.
        print("Taxa de juros: \(taxaJuros)%")
        
    }
    
}

func heritageMain() {
    guard let nomeTitular = readLine() else { return }
    guard let numeroConta = Int(readLine()!) else { return }
    guard let saldo = Double(readLine()!) else { return }
    guard let taxaJuros = Double(readLine()!) else { return }
    
    let contaPoupanca = ContaPoupanca(numeroConta: numeroConta, nomeTitular: nomeTitular, saldo: saldo, taxaJuros: taxaJuros)
    
    print("Conta Poupanca:")
    contaPoupanca.exibirInformacoes()
}
