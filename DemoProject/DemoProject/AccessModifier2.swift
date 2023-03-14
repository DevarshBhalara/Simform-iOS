//
//  AccessModifier2.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/03/23.
//

import Foundation

//inheriting Public class from AccessModifier1

public class File2PublicClass: PublicClass{
    override func methodPublic() {
        print("Hello")
    }
}

open class ClassOpen {
    
    var varOpenClass = "varOpenClass"
    private var varPrivate = "varPrivateOpenClass"
    
    func displayClassOpen()  {
        print(varPrivate)
    }
}

fileprivate class ClasssFilePRivate {
    public var a = 10
    
    func methodFilePrivate() {
        print("Method in File Private")
    }
}

class ExtendingFilePrivate /*: ClasssFilePRivate can't extend because super class is File private */ {
    var varFilePrivate = 10
    
//    override func methodFilePrivate() {
//        print()
//    }
    
    
}
