//
//  swiftbrainApp.swift
//  swiftbrain
//
//  Created by Antonio on 2023-04-15.
//

import SwiftUI

@main
struct swiftbrainApp: App {
    @StateObject var noteBook = NoteBookViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView().environmentObject(noteBook)

            }
        }
    }
}
