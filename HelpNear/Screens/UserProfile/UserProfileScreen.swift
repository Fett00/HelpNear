//
//  UserProfileScreen.swift
//  HelpNear
//
//  Created by Daniel Krivelev on 13.06.2022.
//

import UIKit

class UserProfileScreen: UIViewController {
  var state = false
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var profileInfo: UIImageView!

  @IBAction func pinPressed(_ sender: Any) {
    if state {
      pin.image = UIImage(named: "GetHelpPin")
      profileInfo.image = UIImage(named: "GetHelp")
    } else {
      pin.image = UIImage(named: "VolunteerPin")
      profileInfo.image = UIImage(named: "Volunteer")
    }
    state.toggle()
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
