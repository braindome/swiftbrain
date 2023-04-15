//
//  NoteBookViewModel.swift
//  swiftbrain
//
//  Created by Antonio on 2023-04-15.
//

import Foundation

class NoteBookViewModel : ObservableObject {
    
    @Published var noteList = [Note]()
    
    init() {
        addMockData()
    }
    
    
    func addMockData() {
        noteList.append(Note(title: "Shopping List", category: "Household", content: "Buy soap, shampoo and cookies", priority: 3))
        noteList.append(Note(title: "New routines", category: "Work", content: "Learn new routines for the helicopter landing", priority: 2))
        noteList.append(Note(title: "Plants FFS", category: "Household", content: "We need to start watering the plants", priority: 4))
        noteList.append(Note(title: "Assignment deadline!", category: "School", content: "Deadline soon!!!!! you need to learn everything about nil checking", priority: 1))
        noteList.append(Note(title: "Flights", category: "Vacay", content: "Reminder to buy flight tickets to Prague", priority: 3))
        noteList.append(Note(title: "New EP!", category: "Music", content: "New Ghost single is out now!!", priority: 3))
    }
    
    func update(note: Note, with title: String, with content: String) {
        if let index = noteList.firstIndex(of: note) {
            noteList[index].title = title
            noteList[index].content = content
        }
    }
    
    
}
