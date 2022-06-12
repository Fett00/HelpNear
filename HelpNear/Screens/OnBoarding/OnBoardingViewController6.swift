//
//  OnBoardingViewController6.swift
//  HelpNear
//
//  Created by Daniel Krivelev on 12.06.2022.
//

import UIKit

class OnBoardingViewController6: UIViewController {

  @IBOutlet weak var infoLabel: UILabel!
  @IBAction func backButtonPressed(_ sender: Any) {
    let vc = OnBoardingViewController5(nibName: "OnBoardingViewController5", bundle: nil)
    navigationController?.setViewControllers([vc], animated: false)
  }

  @IBAction func nextButtonPressed(_ sender: Any) {
    let mainVC = ProjectCoordinator.shared.createMainScreen()
    navigationController?.setViewControllers([mainVC], animated: true)
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
    infoLabel.font = UIFont(name: "Bahnschrift", size: 35)
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
