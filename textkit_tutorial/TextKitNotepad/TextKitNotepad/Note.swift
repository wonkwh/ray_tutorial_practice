//
//  Note.swift
//  TextKitNotepad
//
//  Created by wonkwh on 20/02/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import Foundation

class Note {
    var contents: String
    let timestamp: Date
    
    // an automatically generated note title, based on the first line of the note
    var title: String {
        let lines = contents.components(separatedBy: .newlines)
        return lines[0]
    }
    
    init(text: String) {
        contents = text
        timestamp = Date()
    }
}
