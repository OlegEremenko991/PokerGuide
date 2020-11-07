//
//  OnboardingService.swift
//  PokerApp1
//
//  Created by Олег Еременко on 07.11.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import Foundation
import OnboardKit

final class OnboardingService {
    
// MARK: Public properties
    
    static let shared = OnboardingService()
    
    let pages = [
        OnboardPage(title: "Check out poker news", imageName: "page1", description: "Everything you need to know about WSOP is here!"),
        OnboardPage(title: "Study poker rules", imageName: "page2", description: "Read poker guides to become familiar with the game and play better!"),
        OnboardPage(title: "Watch poker videos", imageName: "page3", description: "Raise your poker skill with video guides!"),
        OnboardPage(title: "Get support", imageName: "page4", description: "If you need support feel free to open 'Support' tab and ask your question!", advanceButtonTitle: "Get started!")
        ]
    
    let appearance = OnboardViewController.AppearanceConfiguration(tintColor: .black, titleColor: .black, textColor: .black, backgroundColor: .white, imageContentMode: .scaleAspectFit)
    
// MARK: Private properties
    
    private let newUserKey = "isNewUser"
    
// MARK: Public methods
        
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: newUserKey)
    }
    
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: newUserKey)
    }
}
