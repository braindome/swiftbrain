//
//  NewEntryView.swift
//  swiftbrain
//
//  Created by Antonio on 2023-04-15.
//

import Foundation
import SwiftUI

struct NoteEntryView : View {
    
    var note : Note?
    
    @EnvironmentObject var noteBook : NoteBookViewModel

    
    @State var title : String = ""
    @State var content : String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            VStack {
                    TextField("Title", text: $title)
                    Spacer()
                    if content.isEmpty {
                        Text("Insert note here")
                            .foregroundColor(.gray)
                            .opacity(0.6)
                            .padding(.horizontal, 8)
                            .padding(.top, 8)
                    }
                    TextEditor(text: $content)
                        .padding()
                }
                .background(Color.white)
                .cornerRadius(8)
                .padding()
        }
        .onAppear(perform: setText)
        .navigationBarItems(trailing: Button("Save") {
            saveEntry()
            presentationMode.wrappedValue.dismiss()
        })
        
    }
    
    func saveEntry() {
        if let note = note {
            // update old note
            noteBook.update(note: note, with: title, with: content)
        } else {
            // create new note
            let newNote = Note(title: title, content: content)
            noteBook.noteList.append(newNote)
        }
    }
    
    private func setText() {
        if let note = note {
            title = note.title ?? ""
            content = note.content ?? ""
        }
    }
    
}

struct NoteEntryView_Previews : PreviewProvider {
    static var previews : some View {
        NoteEntryView()
    }
}
