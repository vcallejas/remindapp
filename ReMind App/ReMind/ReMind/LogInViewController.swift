//
//  LogInViewController.swift
//  ReMind
//
//  Created by Victor Callejas on 12/1/22.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
       
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogIn(_ sender: Any) {
            let vc = storyboard?.instantiateViewController(identifier: "Remind_") as! ViewController
            present(vc, animated: true)
    }
 
        
    @IBAction func CreateAnAccount(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "create_acc") as! RegistrationViewController
        present(vc, animated: true)
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

