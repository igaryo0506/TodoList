//
//  TodoItem.swift
//  ToDoList
//
//  Created by Hoge on 2023/09/04.
//

import Foundation
import RealmSwift

class TodoItem: Object {
    @Persisted var title: String = ""
    @Persisted var detail: String = ""
    @Persisted var date: String = ""
}
