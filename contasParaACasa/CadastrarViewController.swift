//
//  CadastrarViewController.swift
//  contasParaACasa
//
//  Created by Gustavo Ferreira Bassani on 16/11/23.
//

import UIKit
import FirebaseAuth

class CadastrarViewController: UIViewController {

    /*Marks outlets*/
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textSenha: UITextField!
    @IBOutlet weak var textConfirmarSenha: UITextField!
    @IBOutlet weak var textNome: UITextField!
    
    let mensagem = Mensagem()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        
        }

        @objc func dismissKeyboard() {
            view.endEditing(true)
        }

    @IBAction func actionCadastrar(_ sender: Any) {
        
        if let emailR = textEmail.text,
           let senhaR = textSenha.text,
           let senhaConfirmacaoR = textConfirmarSenha.text {
            
            if senhaR == senhaConfirmacaoR { /* Tratamento para senhas iguais*/
                let autenticacao = Auth.auth()

                autenticacao.createUser(withEmail: emailR, password: senhaR) { (usuario, erro) in
                    if erro == nil {
                        if usuario == nil { /* Tratamento usuario vazio*/
                            
                            self.present(self.mensagem.exibirMensagemErro(titulo: "Erro ao cadastrar.", mensagem: "Verifique os dados digitados."), animated: true)
                            
                        } else { /* Tratamento para cadastro com sucesso*/
                            
                            

                                self.performSegue(withIdentifier: "cadastroSegue", sender: nil)
  
                            

                            
                        }
                    } else { /* Tratamento para erro de cadastro*/

                        /*
                         Tipos de erro
                         ERROR_INVALID_EMAIL
                         ERROR_WEAK_PASSWORD
                         ERROR_EMAIL_ALREADY_IN_USE
                         */
                        
                        let erroR = erro! as NSError
                        
                        
                        if let codigoErro = erroR.userInfo["FIRAuthErrorUserInfoNameKey"]{
                            
                            let erroTexto = codigoErro as! String
                            var mensagemErro = ""
                            switch erroTexto {
                            case "ERROR_INVALID_EMAIL" :
                                mensagemErro = "E-mail inválido, digite um e-mail válido!"
                                break
                            case "ERROR_WEAK_PASSWORD":
                                mensagemErro = "Senha muito fraca, digite uma senha de 6 dígitos com no mínimo uma número e uma letra"
                                break
                            case "ERROR_EMAIL_ALREADY_IN_USE":
                                mensagemErro = "Este e-mail já está cadastrado. Faça o login na opção Entrar, ou cadastre um E-mail diferente."
                                break
                            default:
                                mensagemErro = "Os dados digitados estão incorretos."
                            }
                            
                            self.present(self.mensagem.exibirMensagemErro(titulo: "Erro ao cadastrar", mensagem: mensagemErro), animated: true)
                            
                        }
                        
                        
                    } /* Fim do tratamento para erro de cadastro*/
                }
                
                                
                
            } else { /* Tratamento para senhas diferentes*/
            
                present(self.mensagem.exibirMensagemErro(titulo: "Senhas diferentes.", mensagem: "As senha inseridas devem ser iguais."), animated: true)
                    
                
            } /* Fim da validacao de senha*/
            
        }
        
    }

}


