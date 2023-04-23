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
    func formatHour(hour: Int) -> String
    func hourFromDate(date: Date) -> Int
    func setEvents(cell: TasksTableViewCell, events: [Event])
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
    
    func monthDayString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL dd"
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
    
    func hourFromDate(date: Date) -> Int {
        let components = calendar.dateComponents([.hour], from: date)
        return components.hour!
    }
    
    func firstOfMonth(date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    
    func weekDay(date: Date) -> Int {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday!
    }
    
    func weekDayAsString(date: Date) -> String {
        switch weekDay(date: date) {
        case 0:
            return "Понедельник"
        case 1:
            return "Вторник"
        case 2:
            return "Среда"
        case 3:
            return "Четверг"
        case 4:
            return "Пятница"
        case 5:
            return "Суббота"
        case 6:
            return "Воскресенье"
        default:
            return ""
        }
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
    
    func formatHour(hour: Int) -> String {
        return String(format: "%02d:%02d", hour, 0)
    }
    
    func setEvents(cell: TasksTableViewCell, events: [Event]) {
        hideAll(cell: cell)
        switch events.count {
        case 1:
            setEvent1(cell: cell, event: events[0])
        case 2:
            setEvent1(cell: cell, event: events[0])
            setEvent2(cell: cell, event: events[1])
        case 3:
            setEvent1(cell: cell, event: events[0])
            setEvent2(cell: cell, event: events[1])
            setEvent3(cell: cell, event: events[2])
        case let count where count>3:
            setEvent1(cell: cell, event: events[0])
            setEvent2(cell: cell, event: events[1])
            setMoreEvents(cell: cell, count: events.count-2)
        default:
            break
        }
    }
    
    private func setEvent1(cell: TasksTableViewCell, event: Event) {
        cell.taskText1.isHidden = false
        cell.taskText1.text = event.name
    }
    
    private func setEvent2(cell: TasksTableViewCell, event: Event) {
        cell.taskText2.isHidden = false
        cell.taskText2.text = event.name
    }
    
    private func setEvent3(cell: TasksTableViewCell, event: Event) {
        cell.taskText3.isHidden = false
        cell.taskText3.text = event.name
    }
    
    private func setMoreEvents(cell: TasksTableViewCell, count: Int) {
        cell.taskText3.isHidden = false
        cell.taskText3.text = String(count) + " More events"
    }
    
    func hideAll(cell: TasksTableViewCell) {
        cell.taskText1.isHidden = true
        cell.taskText2.isHidden = true
        cell.taskText3.isHidden = true
    }
}
