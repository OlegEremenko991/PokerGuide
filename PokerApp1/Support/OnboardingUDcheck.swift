//
//  OnboardingUDCheck.swift
//  PokerApp1
//
//  Created by Олег Еременко on 07.08.2020.
//  Copyright © 2020 Oleg Eremenko. All rights reserved.
//

import Foundation

class OnboardingUDcheck {
    
    static let shared = OnboardingUDcheck()
    
    private let key1 = "isNewUser"
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: key1)
    }
    
    func setIsNotNewUser(){
        UserDefaults.standard.set(true, forKey: key1)
    }
}
