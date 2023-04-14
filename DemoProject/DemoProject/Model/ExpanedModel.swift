//
//  ExpanedModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/04/23.
//

import Foundation
struct ExpandedModel {
    var data: String
    var isExpanded: Bool = false
    
    static func getAllData() -> [ExpandedModel] {
        
        return [
            ExpandedModel(data: "A long description is a way to provide long alternative text for non-text elements, such as images. Generally, alternative text exceeding 250 characters, which cannot be made more concise without making it less descriptive or meaningful, should have a long description. Examples of suitable use of long description are charts, graphs, maps, infographics, and other complex images." , isExpanded: false),
            ExpandedModel(data: "A long description is a way to provide long alternative text for non-text elements, such as images. Generally, alternative text exceeding 250 characters, which cannot be made more concise without making it less descriptive or meaningful, should have a long description. Examples of suitable use of long description are charts, graphs, maps, infographics, and other complex images." , isExpanded: false),
            ExpandedModel(data: "A long description is a way to provide long alternative text for non-text elements, such as images. Generally, alternative text exceeding 250 characters, which cannot be made more concise without making it less descriptive or meaningful, should have a long description. Examples of suitable use of long description are charts, graphs, maps, infographics, and other complex images." , isExpanded: false),
            ]
    }
}
