//
//  GroupStructureModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 27/04/23.
//

import Foundation
struct GroupStructureModel {
    
    var sectionName: String
    var isSectionIconClick: Bool?
    var playerData: [GroupModel]
    
    static func getAllPlayerData() -> [GroupStructureModel] {
        return [
            GroupStructureModel(sectionName: "Group A This is just test", isSectionIconClick: false ,playerData: [
                GroupModel(playerName: "You", cardsEarned: "0", antePenalities: "$12.00" ,isChatVisible: false, isChatClicked: false),
                GroupModel(playerName: "Gail Forcewind", cardsEarned: "6", antePenalities: "$12.00" ,isChatVisible: true, isChatClicked: false)]),
            
            GroupStructureModel(sectionName: "Group B A This is just test test ", isSectionIconClick: false ,playerData: [
                GroupModel(playerName: "You", cardsEarned: "0", antePenalities: "$12.00" ,isChatVisible: false, isChatClicked: false),
                GroupModel(playerName: "Gail Forcewind", cardsEarned: "6", antePenalities: "$12.00" ,isChatVisible: true, isChatClicked: false),
                GroupModel(playerName: "Gail Forcewind", cardsEarned: "6", antePenalities: "$12.00" ,isChatVisible: true, isChatClicked: false)]),
            
            GroupStructureModel(sectionName: "Group B", isSectionIconClick: false ,playerData: [
                GroupModel(playerName: "You", cardsEarned: "0", antePenalities: "$12.00" ,isChatVisible: false, isChatClicked: false),
                GroupModel(playerName: "Gail Forcewind", cardsEarned: "6", antePenalities: "$12.00" ,isChatVisible: true, isChatClicked: false),
                GroupModel(playerName: "Gail Forcewind", cardsEarned: "6", antePenalities: "$12.00" ,isChatVisible: true, isChatClicked: false)])]
    }
    
}
