//
//  Mensagem.swift
//  contasParaACasa
//
//  Created by Gustavo Ferreira Bassani on 16/11/23.
//

import Foundation
import UIKit

struct Mensagem {
    
    func exibirMensagemErro(titulo: String, mensagem: String) -> UIAlertController {
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let acao = UIAlertAction(title: "Cancelar", style: .cancel)
        alerta.addAction(acao)
        
        return alerta
        
    }
    
    func exibirMensagemOK(titulo: String, mensagem: String) -> UIAlertController {
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let acao = UIAlertAction(title: "Ok", style: .default)
        alerta.addAction(acao)
        
        return alerta
        
    }
}
