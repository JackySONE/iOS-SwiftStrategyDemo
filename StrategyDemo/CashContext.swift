//
//  CashContext.swift
//  StrategyDemo
//
//  Created by JackySONE on 2018/9/20.
//  Copyright © 2018年 JackySONE. All rights reserved.
//

import Foundation

//在實現策略模式時，主要目標是定義一個無需修改或者繼承的環境類
class CashContext {

    fileprivate var cs: CashStrategy?
    
    init(withStrategy strategy: CashStrategy?) {
        self.cs = strategy
    }
    
    func getResult(withMoney money: Float) -> Float {
        return cs?.acceptCash(money: money) ?? 0.0
    }
}
