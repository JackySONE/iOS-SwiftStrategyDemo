//
//  RebateStrategy.swift
//  StrategyDemo
//
//  Created by 賴彥宇 on 2018/9/20.
//  Copyright © 2018年 JackySONE. All rights reserved.
//

import Foundation

class RebateStrategy: CashStrategy {

    fileprivate var moneyRebate: Float = 1.0

    init(moneyRebate: Float) {
        self.moneyRebate = moneyRebate
    }

    func acceptCash(money: Float) -> Float {
        return money * moneyRebate
    }
    
}
