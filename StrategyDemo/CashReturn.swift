//
//  CashReturn.swift
//  StrategyDemo
//
//  Created by 賴彥宇 on 2018/9/20.
//  Copyright © 2018年 JackySONE. All rights reserved.
//

import Foundation

class CashReturn: CashNormal {

    fileprivate var moneyCondition: Float = 0.0
    fileprivate var moneyReturn: Float = 0.0

    init(moneyCondition condition: Float, moneyReturn mReturn: Float) {
        self.moneyCondition = condition
        self.moneyReturn = mReturn
    }

    override func acceptCash(money: Float) -> Float {
        var result = money
        if money >= self.moneyCondition {
            result = money - floorf(money / moneyCondition) * moneyReturn
        }
        return result
    }
}
