//
//  OnBoardingViewController.swift
//  HelpNear
//

import UIKit

class OnBoardingViewController: UIViewController {

  @IBAction func registerPressed(_ sender: Any) {
    let vc = OnBoardingViewController3(nibName: "OnBoardingViewController3", bundle: nil)
    navigationController?.setViewControllers([vc], animated: true)
  }
  @IBAction func enterPressed(_ sender: Any) {
    let vc = OnBoardingViewController1(nibName: "OnBoardingViewController1", bundle: nil)
    navigationController?.setViewControllers([vc], animated: true)
  }
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
