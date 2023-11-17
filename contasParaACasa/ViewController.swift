//
//  ViewController.swift
//  contasParaACasa
//
//  Created by Gustavo Ferreira Bassani on 16/11/23.
//

import UIKit

class ViewController: UIViewController {

    /* Mark outlets*/

    @IBOutlet weak var buttonEntrar: UIButton!
    @IBOutlet weak var buttonCadastrar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonEntrar.layer.cornerRadius = 20
        buttonCadastrar.layer.cornerRadius = 20
        
    }


}

