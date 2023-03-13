//
//  FileTwo.swift
//  access_modifier_demo
//
//  Created by Devarsh Bhalara on 10/03/23.
//

import Foundation
public class File2PublicClass: PublicClass{
    override func methodPublic() {
        print("Hellp")
    }
}

open class ClassOpen {
    var varOpenClass = "varOpenClass"
    private var varPrivate = "varPrivateOpenClass"
    func display()  {
        print(varPrivate)
    }
}

fileprivate class ClasssFilePRivate {
    public var a = 10
}
