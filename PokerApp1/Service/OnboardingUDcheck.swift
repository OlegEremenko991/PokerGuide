//
//  OnboardingUDCheck.swift
//  PokerApp1
//
//  Created by Олег Еременко on 07.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import Foundation

public final class OnboardingUDcheck {
    
    static let shared = OnboardingUDcheck()
    
// MARK: Private properties
    
    private let key1 = "isNewUser"
    
// MARK: Public methods
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: key1)
    }
    
    func setIsNotNewUser(){
        UserDefaults.standard.set(true, forKey: key1)
    }
}
