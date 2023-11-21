import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets para os elementos da interface do usuário
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var haveaccountButton: UIButton!
    @IBOutlet weak var privacyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configura os tipos de teclado e delegados para campos de texto.
        nameTextField.keyboardType = .default
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        // Configura os elementos de interface do usuário.
        configElements()
        
        // Habilita o botão "Cadastrar".
        registerButton.isEnabled = true
    }
    
    // Função chamada quando o botão "Cadastrar" é pressionado.
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        // Verifica se algum campo está vazio.
        var anyFieldEmpty = false
        
        if !nameTextField.hasText {
            highlightTextField(nameTextField) // Destaca o campo em vermelho.
            anyFieldEmpty = true
        }
        if !isValidEmail(emailTextField.text) {
            highlightTextField(emailTextField) // Destaca o campo em vermelho.
            anyFieldEmpty = true
        }
        let password = passwordTextField.text
        if !isValidPassword(password) {
            highlightTextField(passwordTextField) // Destaca o campo em vermelho.
            displayPasswordError(password) // Exibe uma mensagem de erro.
            anyFieldEmpty = true
        }
        
        
        // Se nenhum campo estiver vazio e a senha for válida, execute a lógica de registro.
        if !anyFieldEmpty {
            registerUser()
        }
    }
    
    @IBAction func tappedLogin(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    // Configura os elementos de interface do usuário.
    func configElements() {
        view.backgroundColor = .systemBackground
        
        // Configura os placeholders dos campos de texto.
        nameTextField.placeholder = "Digite seu nome"
        emailTextField.placeholder = "Digite seu e-mail"
        passwordTextField.placeholder = "Digite sua senha"
        
        // Configura o título do botão de registro.
        registerButton.setTitle("Cadastrar", for: .normal)
    }
    
    // Lógica de registro.
    func registerUser() {
        //        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                // Exibir alerta de erro
                let alertController = UIAlertController(title: "Erro no registro", message: "Ocorreu um erro durante o registro: \(error.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                
                // Certifique-se de estar chamando 'present' em um contexto apropriado
                self.present(alertController, animated: true, completion: nil)
            } else {
                // Registro bem-sucedido, navegar para a tela de verificação
                let verificationViewController = self.storyboard?.instantiateViewController(withIdentifier: String(describing: VerificationViewController.self)) as? VerificationViewController
                self.navigationController?.pushViewController(verificationViewController ?? UIViewController(), animated: true)
            }
        }
    }
    
    // Função chamada quando o usuário encerra a edição de um campo de texto.
    func textFieldDidEndEditing(_ textField: UITextField) {
        unhighlightTextField(textField) // Remove o destaque vermelho.
    }
    
    // Função chamada quando o usuário inicia a edição de um campo de texto.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        unhighlightTextField(textField) // Remove o destaque vermelho.
    }
    
    // Destaca um campo de texto em vermelho.
    func highlightTextField(_ textField: UITextField) {
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.red.cgColor
    }
    
    // Remove o destaque vermelho de um campo de texto.
    func unhighlightTextField(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
    
    // Verifica se um e-mail é válido usando uma expressão regular.
    func isValidEmail(_ email: String?) -> Bool {
        guard let email = email else { return false }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    // Verifica se uma senha atende a critérios específicos.
    func isValidPassword(_ password: String?) -> Bool {
        guard let password = password else { return false }
        
        // Verifica se a senha tem pelo menos 6 caracteres.
        if password.count < 6 {
            return false
        }
        
        // Verifica se a senha tem pelo menos um caractere não alfanumérico.
        let nonAlphanumericRegex = ".*[^A-Za-z0-9].*"
        let nonAlphanumericTest = NSPredicate(format: "SELF MATCHES %@", nonAlphanumericRegex)
        if !nonAlphanumericTest.evaluate(with: password) {
            return false
        }
        
        // Verifica se a senha tem pelo menos uma letra minúscula e uma letra maiúscula.
        let lowercaseRegex = ".*[a-z].*"
        let lowercaseTest = NSPredicate(format: "SELF MATCHES %@", lowercaseRegex)
        let uppercaseRegex = ".*[A-Z].*"
        let uppercaseTest = NSPredicate(format: "SELF MATCHES %@", uppercaseRegex)
        if !lowercaseTest.evaluate(with: password) || !uppercaseTest.evaluate(with: password) {
            return false
        }
        
        return true
    }
    
    // Exibe uma mensagem de erro para senhas inválidas.
    func displayPasswordError(_ password: String?) {
        guard let password = password else { return }
        var errorMessage = "A senha deve ter pelo menos:"
        
        if password.count < 6 {
            errorMessage += "\n• 6 caracteres"
        }
        if !password.contains(where: { !$0.isLetter && !$0.isNumber }) {
            errorMessage += "\n• um caractere não alfanumérico"
        }
        if !password.contains(where: { $0.isLowercase }) {
            errorMessage += "\n• uma letra minúscula ('a'-'z')"
        }
        if !password.contains(where: { $0.isUppercase }) {
            errorMessage += "\n• uma letra maiúscula ('A'-'Z')"
        }
        
        // Exibe a mensagem de erro em um alerta.
        let alertController = UIAlertController(title: "Erro na senha", message: errorMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
