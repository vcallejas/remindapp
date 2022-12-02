//
//  ViewController.swift
//  ReMind
//
//  Created by Victor Callejas on 11/10/22.
//

import UserNotifications
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var models = [ReMind]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func didTapAdd() {
        
        // show add vc
        guard let vc = storyboard?.instantiateViewController(identifier: "add") as? AddViewController else {
            return
        }
        vc.title = "New ReMind"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { title, body, date in
            DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                //let new = ReMind(title: title, date: date, identifier: "id_\(title)")
                //self.models.append(new)
                //self.table.reloadData()
                
                let content = UNMutableNotificationContent()
                content.title = title
                content.sound = .default
                content.body = body
                
                let targetDate = date
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second],
                                                                                                          from: targetDate) , repeats: false)
                let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
                    if error != nil {
                        print("there is an error")
                        
                    }
                })
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func didTapTest() {
        
        // show test vc and test the new added notification
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { success, error in
            if success{
                self.scheduleTest()
            
        }
            else if error != nil {
                print("there was an error")
            }
        })
        
    }
    
    func scheduleTest(){
        let content = UNMutableNotificationContent()
        content.title = "Hello World"
        content.sound = .default
        content.body = "this is a test for notifications."
        
        let targetDate = Date().addingTimeInterval(10)
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second],
                                                                                                  from: targetDate) , repeats: false)
        let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
            if error != nil {
                print("there is an error")
            }
        })
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView (_ tableView: UITableView, didSelectRowAt indexpath: IndexPath) {
        tableView.deselectRow(at: indexpath, animated: true)
    }
    
    

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        
        return cell
    }
}
 
struct ReMind {
    let title = String()
    let date = String()
    let identifier = String()
}
   

