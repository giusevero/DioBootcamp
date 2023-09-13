//
//  ArrayChallenge.swift
//  DioCLT
//
//  Created by Giugliano Severo on 05/09/23.
//

import Foundation

func ArrayChallengeMain() {
    let interfaceAcionistas = InterfaceAcionistas()
    let scanner = Scanner()

//    let dataInicial = scanner.nextLine()
//    let dataFinal = scanner.nextLine()
    
    let dataInicial = "05/01/2023"
    let dataFinal = "03/03/2023"

    let analises = interfaceAcionistas.obterAnalisesDesempenho(dataInicial: dataInicial, dataFinal: dataFinal)

    for analise in analises {
        print(analise)
    }
}

class InterfaceAcionistas {
    func obterAnalisesDesempenho(dataInicial: String, dataFinal: String) -> [String] {
        var analises = [String]()

        var analisesOriginais = [Analise]()
        analisesOriginais.append(Analise(data: "01/01/2023", analise: "Analise de Desempenho Financeiro"))
        analisesOriginais.append(Analise(data: "15/02/2023", analise: "Analise de Riscos e Exposicoes"))
        analisesOriginais.append(Analise(data: "31/03/2023", analise: "Analises Corporativas"))
        analisesOriginais.append(Analise(data: "01/04/2023", analise: "Analise de Politicas e Regulamentacoes"))
        analisesOriginais.append(Analise(data: "15/05/2023", analise: "Analise de Ativos"))
        analisesOriginais.append(Analise(data: "30/06/2023", analise: "Analise de Inovacao e Tecnologia"))

    // TODO: Implemente o filtro das análises dentro do período especificado. Dica: Crie uma lista para armazenar as análises filtradas e use um loop for para filtrar as análises.
    
        let initDate = parseDate(dateString: dataInicial)
        let finalDate = parseDate(dateString: dataFinal)
        let range = initDate...finalDate
        
        let analisePrimaria = analisesOriginais.filter {
            return range.contains(parseDate(dateString: $0.data))
        }
        
   // TODO: Retorne a lista de análises filtradas.
        analises = analisePrimaria.compactMap{
            $0.analise
        }

        return analises
    }

    func parseDate(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: dateString) ?? Date()
    }
}

class Analise {
    let data: String
    let analise: String

    init(data: String, analise: String) {
        self.data = data
        self.analise = analise
    }
}

class Scanner {
    func nextLine() -> String {
        let line = readLine()
        return line ?? ""
    }
}
