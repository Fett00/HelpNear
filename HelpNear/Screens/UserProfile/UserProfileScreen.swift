//
//  UserProfileScreen.swift
//  HelpNear
//
//  Created by Daniel Krivelev on 13.06.2022.
//

import UIKit

class UserProfileScreen: UIViewController {
  var state = true
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var profileInfo: UIImageView!

  @IBAction func pinPressed(_ sender: Any) {
    let alert = UIAlertController(title: "Подтверждение", message: "Сменить роль?", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Да", style: UIAlertAction.Style.default, handler: {[self] _ in 
      if state {
        pin.image = UIImage(named: "GetHelpPin")
        profileInfo.image = UIImage(named: "GetHelp")
      } else {
        pin.image = UIImage(named: "VolunteerPin")
        profileInfo.image = UIImage(named: "Volunteer")
      }
      state.toggle()
    }))
    alert.addAction(UIAlertAction(title: "Нет", style: UIAlertAction.Style.default, handler: nil))
    self.present(alert, animated: true, completion: nil)

  }
  @IBOutlet weak var pin: UIImageView!
  override func viewDidLoad() {
        super.viewDidLoad()
      usernameLabel.font = UIFont(name: "Bahnschrift", size: 25)
      usernameLabel.textColor = UIColor.darkGray
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
