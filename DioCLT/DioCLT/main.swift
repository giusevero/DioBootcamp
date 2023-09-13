//
//  main.swift
//  DioCLT
//
//  Created by Giugliano Severo on 05/09/23.
//

import Foundation

class Bancaria {
    var numeroConta: Int
    var nomeTitular: String
    var saldo: Double

    init(numeroConta: Int, nomeTitular: String, saldo: Double) {
        self.numeroConta = numeroConta
        self.nomeTitular = nomeTitular
        self.saldo = saldo
    }

    func getNumeroConta() -> Int {
        return self.numeroConta
    }

    func getNomeTitular() -> String {
        return self.nomeTitular
    }

    func getSaldo() -> Double {
        return self.saldo
    }
}

//if let numeroConta = Int(readLine() ?? ""),
//   let nomeTitular = readLine(),
//   let saldo = Double(readLine() ?? "") {
//
//    //TODO: Criar uma instância de "ContaBancaria" com os valores de Entrada.
//    let conta = Bancaria(numeroConta: numeroConta,
//                         nomeTitular: nomeTitular,
//                         saldo: saldo)
//
//    print("Informacoes:")
//    //TODO: Imprimir as informações da conta usando o objeto criado no TODO acima.
//    print("Conta: \(conta.numeroConta)")
//    print("Titular: \(conta.nomeTitular)")
//    print("Saldo: R$ \(conta.saldo)")
//
//}

testCastChallengeMain()
