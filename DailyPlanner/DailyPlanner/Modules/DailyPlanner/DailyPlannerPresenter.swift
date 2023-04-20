//
//  DailyPlannerPresenter.swift
//  DailyPlanner
//
//  Created by Lena Vorontsova on 18.04.2023.
//

import UIKit

protocol DailyPlannerPresenting: AnyObject {
    func plusMonth(date: Date) -> Date
    func minusMonth(date: Date) -> Date
    func monthString(date: Date) -> String
    func yearString(date: Date) -> String
    func daysInMonth(date: Date) -> Int
    func daysOfMonth(date: Date) -> Int 
    func firstOfMonth(date: Date) -> Date
    func weekDay(date: Date) -> Int
    func addDays(date: Date, days: Int) -> Date
    func mondayForDate(date: Date) -> Date 
}

final class DailyPlannerPresenter: DailyPlannerPresenting {
    weak var controller: DailyPlannerViewController?
    let calendar = Calendar.current
    
    func plusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .weekOfMonth, value: 1, to: date)!
    }
    
    func minusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .weekOfMonth, value: 7, to: date)!
    }
    
    func monthString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }
    
    func yearString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
    func daysInMonth(date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    func daysOfMonth(date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    func firstOfMonth(date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    func weekDay(date: Date) -> Int {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday!
    }
    
    internal func addDays(date: Date, days: Int) -> Date {
        return calendar.date(byAdding: .day, value: days, to: date)!
    }
    
    func mondayForDate(date: Date) -> Date {
        var current = date
        let oneWeekAgo = addDays(date: current, days: -7)
        while current > oneWeekAgo {
            let currentWeekDay = calendar.dateComponents([.weekday], from: current).weekday
            if currentWeekDay == 1 {
                return current
            }
            current = addDays(date: current, days: -1)
        }
        return current
    }
}
