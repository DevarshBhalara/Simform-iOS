//
//  FileOne.swift
//  access_modifier_demo
//
//  Created by Devarsh Bhalara on 10/03/23.
//

import Foundation
public class PublicClass {
    func methodPublic() {
        print("Method of public")
    }
}

private class Test {
    private var a = 10
}

private var objPriavateTest = Test()


class Test2 {
    var a = 10
    private var b = 20
}
