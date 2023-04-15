//
//  ContentView.swift
//  swiftbrain
//
//  Created by Antonio on 2023-04-15.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var noteBook : NoteBookViewModel

    var body: some View {
        VStack {
            List() {
                ForEach(noteBook.noteList) { note in
                    NavigationLink(destination: NoteEntryView(note: note)
                        .environmentObject(noteBook))
                        {
                        RowView(note: note)
                    }
                }
            }
        }
        .navigationTitle("Notebook")
        .navigationBarItems(trailing: NavigationLink(destination: NoteEntryView()) {
            Image(systemName: "plus.circle")
        })
        .padding()

    }
    
    struct RowView : View {
        let note : Note
        var body : some View {
            HStack {
                if let title = note.title {
                    Text(title)
                }
            }

        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let n = NoteBookViewModel()
        ContentView().environmentObject(n)
    }
}

