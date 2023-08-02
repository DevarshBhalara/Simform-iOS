//
//  Note.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 02/08/23.
//

import FirebaseFirestore

struct Note {
    let title: String
    let content: String
    let timeStamp: Timestamp
    
    func toDictionary() -> [String: Any] {
        return [
            "title": self.title,
            "content": self.content,
            "time": self.timeStamp
        ]
    }
}
