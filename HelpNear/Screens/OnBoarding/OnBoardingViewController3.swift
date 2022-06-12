//
//  OnBoardingViewController3.swift
//  HelpNear
//

import UIKit

class OnBoardingViewController3: UIViewController {

  @IBOutlet weak var enterButton: UIButton!
  override func viewDidLoad() {
        super.viewDidLoad()
    enterButton.layer.shadowColor = UIColor.black.cgColor
    enterButton.layer.shadowOffset = CGSize(width: 0, height: 4)
    enterButton.layer.shadowOpacity = 0.3
    enterButton.layer.shadowRadius = 3
    enterButton.layer.masksToBounds = false
        // Do any additional setup after loading the view.
    }


  @IBAction func createPressed(_ sender: Any) {
    let vc = OnBoardingViewController4(nibName: "OnBoardingViewController4", bundle: nil)
    navigationController?.setViewControllers([vc], animated: true)
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
