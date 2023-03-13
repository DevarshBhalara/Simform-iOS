//
//  AccessModifier1.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/03/23.
//

import Foundation
public class PublicClass {
    
    var varPublicClass = 20
    
    func methodPublic() {
        print("Method of public")
    }
}

private class Test {
    private var memberTestA = 10
}

//private var objPriavateTest = Test()

class Test2: ClassOpen {
    
    var memberVariableA = 10
    private var memberVariableB = 20
    
    private func privateMethod() {
        print("This is private method")
    }
    
    func nonPrivateMethod() {
        print("This is not private")
    }
    
    override func displayClassOpen() {
        print("This is override method of ClassOpen")
        super.displayClassOpen()
    }
    
}
