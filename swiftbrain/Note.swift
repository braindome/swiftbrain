//
//  Note.swift
//  swiftbrain
//
//  Created by Antonio on 2023-04-15.
//

import Foundation

struct Note : Identifiable, Equatable {
    var id = UUID()
    var title : String?
    var category : String?
    var content : String?
    var color : String?
    var priority : Int?
}
