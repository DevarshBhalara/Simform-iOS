//
//  ClassPublic.swift
//  Access_Modifier
//
//  Created by Devarsh Bhalara on 03/03/23.
//

import Foundation
public class PublicClass{
    var a: Int = 10
    private var aa: Int = 20
    
    fileprivate func printtt()->(){
        print("From Public ")
    }
}
class PublicClass2 : PublicClass {
    
    
    func printPublic()-> () {
        super.printtt()
    }
}

private class PrivateClass  {
    
    private var a1: Int = 30
    public var aa: Int = 40
}

fileprivate class FilePrivateClass : PrivateClass {
    func printtt()->(){
        print(super.aa)
    }
}


