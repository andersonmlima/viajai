//
//  VerificationViewModel.swift
//  ViajAI
//
//  Created by Anderson Moura on 23/10/23.
//

import Foundation

class VerificationViewModel {
    private var codeVerification: VerificationCode
    
    // Inicialização do ViewModel com o código de verificação fornecido
    init(codeVerification: VerificationCode) {
        self.codeVerification = codeVerification
    }
    
    // Função para verificar se o código inserido pelo usuário é válido
    func isCodeValid(enteredCode: String) -> Bool {
        return enteredCode == codeVerification.code
    }
}
