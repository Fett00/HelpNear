//
//  OnBoardingViewController1.swift
//  HelpNear
//

import UIKit

class OnBoardingViewController1: UIViewController {
  @IBOutlet weak var passwordField: UITextField!
  @IBOutlet weak var emailField: UITextField!

  @IBAction func nextButtonPressed(_ sender: Any) {
    checkUser(login: emailField.text, password: passwordField.text)

  }
  @IBAction func backButtonPressed(_ sender: Any) {
    let vc = OnBoardingViewController(nibName: "OnBoardingViewController", bundle: nil)
    navigationController?.setViewControllers([vc], animated: false)

  }

  func checkUser(login: String?, password: String?) {
    guard let login = login, let password = password, isValidEmail(login) else {
      let alert = UIAlertController(title: "Неверный формат данных", message: "Убедитесь, что почта и пароль внесены корректно", preferredStyle: UIAlertController.Style.alert)


      alert.addAction(UIAlertAction(title: "Хорошо!", style: UIAlertAction.Style.default, handler: nil))
      self.present(alert, animated: true, completion: nil)
      return
    }

    goToMain()

  }

  func goToMain() {
    let mainVC = ProjectCoordinator.shared.createMainScreen()
    navigationController?.setViewControllers([mainVC], animated: true)

  }

  func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
  }
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
