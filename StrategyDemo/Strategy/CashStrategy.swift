//
//  CashStrategy.swift
//  StrategyDemo
//
//  Created by 賴彥宇 on 2018/9/20.
//  Copyright © 2018年 JackySONE. All rights reserved.
//

import Foundation

protocol CashStrategy {

    func acceptCash(money: Float) -> Float

}
