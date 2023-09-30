//
//  EditViewController.swift
//  ToDoList
//
//  Created by Hoge on 2023/09/08.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var detailTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    let realm = try! Realm()
    var selectedItem: TodoItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = "\(selectedItem.title)"
        detailTextField.text = "\(selectedItem.detail)"
        
        let date = selectedItem.date
        let startIdxY = date.index(date.startIndex, offsetBy: 0, limitedBy: date.endIndex) ?? date.endIndex
        let endIdxY = date.index(date.startIndex, offsetBy: 4, limitedBy: date.endIndex) ?? date.endIndex
        let year = String(date[startIdxY..<endIdxY])
        
        let startIdxM = date.index(date.startIndex, offsetBy: 5, limitedBy: date.endIndex) ?? date.endIndex
        let endIdxM = date.index(date.startIndex, offsetBy: 7, limitedBy: date.endIndex) ?? date.endIndex
        let month = String(date[startIdxM..<endIdxM])
        
        let startIdxD = date.index(date.startIndex, offsetBy: 8, limitedBy: date.endIndex) ?? date.endIndex
        let endIdxD = date.index(date.startIndex, offsetBy: 10, limitedBy: date.endIndex) ?? date.endIndex
        let day = String(date[startIdxD..<endIdxD])
        
        datePicker.date = Calendar.current.date(from: DateComponents(year : Int(year), month: Int(month), day: Int(day))) ?? Date()
        
    }
    
    @IBAction func update() {
        
        do{
            try realm.write {
                selectedItem.title = titleTextField.text ?? ""
                selectedItem.detail = detailTextField.text ?? ""
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy年MM月dd日"
                selectedItem.date = "\(formatter.string(from: datePicker.date))"
            }
            
        }catch{
        }
        self.dismiss(animated: true)
    }
    
    @IBAction func back() {
        self.dismiss(animated: true)
    }
    
}
