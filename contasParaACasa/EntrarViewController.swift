//
//  EntrarViewController.swift
//  contasParaACasa
//
//  Created by Gustavo Ferreira Bassani on 16/11/23.
//

import UIKit
import FirebaseAuth

class EntrarViewController: UIViewController {

    /* Marks */

    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textSenha: UITextField!
    
    let mensagem = Mensagem()
    
    @IBOutlet weak var buttonEntrar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonEntrar.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    

    @IBAction func actionEntrar(_ sender: Any) {
        if let emailR = textEmail.text,
           let senhaR = textSenha.text {
            
            let autenticacao = Auth.auth()
            autenticacao.signIn(withEmail: emailR, password: senhaR) { (usuario, erro) in
                if erro == nil {
                    if usuario == nil { /* Tratamento usuario vazio*/
                        
                        let mensagem = self.mensagem.exibirMensagemErro(titulo: "Usuário em branco.", mensagem: "Digite o nome de um usuário.")
                        
                    } else { /* Fim do tratamento usuario vazio*/
                        
                        
                    }
    
                } else {/* Tratamento de erro */
                    let mensagem = self.mensagem.exibirMensagemErro(titulo: "Erro ao entrar.", mensagem: "Verifique os dados digitados.")
                    self.present(mensagem, animated: true)
                }
            }
        }
    }
}
