//
//  CombineScreen.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 19/06/23.
//

import Foundation
struct CombineScreenDataWebService {
    let storyBoardName: String
    let vcName: String
    let title: String
    
    static private let stoardBoardForWebService = "WebServiceStoaryBoard"
    static private let stoardBoardForAlamoFire = "AlamoFireDemo"
    static private let stoardBoardForAlamoFireStructured = "AlamoFireStructured"
    static private let stoardBoardForMVVM = "Authentication"
    static private let stoardBoardForMVP = "MVPDemo"
    static private let stoardBoardForViper = "Viper"
    
    static func getAllData() -> [CombineScreenDataWebService] {
        
        return [
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForMVVM, vcName: "LoginVC", title: "MVVMDemo"),
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForViper, vcName: "ViperLoginVC", title: "Viper Demo"),
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForMVP, vcName: "LoginMVPVC", title: "MVP Demo"),
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForWebService, vcName: "UserListViewController", title: "User List (Web Service)"),
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForWebService, vcName: "AddUserViewController", title: "Add User (Web Service)"),
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForWebService, vcName: "DeleteUserViewController", title: "User Delete Request"),
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForWebService, vcName: "UploadImageViewController", title: "Upload Image"),
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForWebService, vcName: "DownloadFileViewController", title: "Download task"),
           
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForWebService, vcName: "UserListAlamoFireViewController", title: "User List (Web Service AlamoFire)"),
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForAlamoFireStructured, vcName: "LoginAlamoFireViewController", title: "Login VM"),
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForWebService, vcName: "AlamoFIreAddUserViewController", title: "Add User (Web Service AlamoFire)"),
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForAlamoFireStructured, vcName: "UplaodImageViewControllerAF", title: "Uplaod Image AF"),
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForAlamoFireStructured, vcName: "DownloadImageViewController", title: "Download Image AF"),
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForAlamoFireStructured, vcName: "RegisterUserViewController", title: "SignUp VM"),
            CombineScreenDataWebService(storyBoardName: CombineScreenDataWebService.stoardBoardForAlamoFire, vcName: "LoginViewController", title: "E-Commerce"),
            
        ]
    }
}
