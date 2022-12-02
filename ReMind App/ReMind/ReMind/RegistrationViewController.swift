//
//  RegistrationViewController.swift
//  ReMind
//
//  Created by Marwan Alnounou on 11/30/22.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpClicked(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "Remind_") as! ViewController
        present(vc, animated: true)
    }
    
    @IBAction func noAccountClicked(_ sender: UIButton) {
        
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
