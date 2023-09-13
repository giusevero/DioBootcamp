//
//  AbstractionChallenge.swift
//  DioCLT
//
//  Created by Giugliano Severo on 05/09/23.
//

import Foundation

class Cofre {
    var tipo: String
    var metodoAbertura: String
    
    init(tipo: String, metodoAbertura: String) {
        self.tipo = tipo
        self.metodoAbertura = metodoAbertura
    }
    
    func imprimirInformacoes() {
        print("Tipo:", tipo)
        print("Metodo de abertura:", metodoAbertura)
    }
}

class CofreDigital: Cofre {
    var senha: Int
    
    init(senha: Int) {
        self.senha = senha
        super.init(tipo: "Cofre Digital", metodoAbertura: "Senha")
    }
    
    func validarSenha(confirmacaoSenha: Int) -> Bool {
        return confirmacaoSenha == senha
    }
}

class CofreFisico: Cofre {
    override init(tipo: String = "Cofre Fisico", metodoAbertura: String = "Chave") {
        super.init(tipo: tipo, metodoAbertura: metodoAbertura)
    }
}

func main() {
    if let tipoCofre = readLine() {
        if tipoCofre.lowercased() == "digital" {
            if let senhaStr = readLine(),
               let senha = Int(senhaStr),
               let confirmacaoSenhaStr = readLine(),
               let confirmacaoSenha = Int(confirmacaoSenhaStr) {
                
                let cofre = CofreDigital(senha: senha)
                cofre.imprimirInformacoes()
                
                // TODO:  Implemente a condição necessário para a verificação dos cofres seguros:
                
                if cofre.validarSenha(confirmacaoSenha: confirmacaoSenha) {
                    print("Cofre aberto!")
                    return
                }
                
                print("Senha incorreta!")
            }
        } else {
            let cofreFisico = CofreFisico()
            cofreFisico.imprimirInformacoes()
        }
    }
}
