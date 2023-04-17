//
//  JobModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 17/04/23.
//

import Foundation
struct JobModel {
    var companyImage: String?
    var jobPosition: String?
    var companyName: String?
    var jobSalary: String?
    
    static func getAllJobs() -> [JobModel] {
        return [
            JobModel(companyImage: "spotify", jobPosition: "Sr. Developer", companyName: "Spotify", jobSalary: "$115,000/y"),
            JobModel(companyImage: "pinterest", jobPosition: "Jr. Executive", companyName: "Pinterest", jobSalary: "$96,000/y"),
            JobModel(companyImage: "burger-king", jobPosition: "Jr. Executive", companyName: "Burger King", jobSalary: "$96,000/y"),
            JobModel(companyImage: "beats", jobPosition: "Product Manager", companyName: "Beats", jobSalary: "$84,000/y"),
        ]
    }
}
