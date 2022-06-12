//
//  OnBoardingViewController5.swift
//  HelpNear
//
//  Created by Daniel Krivelev on 12.06.2022.
//

import UIKit

class OnBoardingViewController5: UIViewController {

  @IBOutlet weak var infoLabel: UILabel!
  @IBAction func backButtonPressed(_ sender: Any) {
    let vc = OnBoardingViewController4(nibName: "OnBoardingViewController4", bundle: nil)
    navigationController?.setViewControllers([vc], animated: false)
  }

  @IBAction func nextButtonPressed(_ sender: Any) {

    let vc = OnBoardingViewController6(nibName: "OnBoardingViewController6", bundle: nil)
    navigationController?.setViewControllers([vc], animated: false)
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
