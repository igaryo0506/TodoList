//
//  NewItemViewController.swift
//  ToDoList
//
//  Created by Hoge on 2023/09/04.
//

import UIKit
import RealmSwift

class NewItemViewController: UIViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var detailTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func save() {
        let item = TodoItem()
        item.title = titleTextField.text ?? ""
        item.detail = detailTextField.text ?? ""
        // 日付のフォーマット
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        //(from: datePicker.date))を指定してあげることで、datePickerで指定した日付が表示される
        item.date = "\(formatter.string(from: datePicker.date))"
        createItem(item: item)
        
        self.dismiss(animated: true)
    }
    
    @IBAction func back() {
        self.dismiss(animated: true)
    }
    
    func createItem(item: TodoItem){
        try! realm.write {
            realm.add(item)
        }
    }
    
}
