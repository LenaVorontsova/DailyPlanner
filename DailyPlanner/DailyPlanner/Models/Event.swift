//
//  Event.swift
//  DailyPlanner
//
//  Created by Lena Vorontsova on 23.04.2023.
//

import Foundation

var eventsList = [Event]()
final class Event {
    let id: Int! = nil
    let date: Date! = nil
    let name: String! = nil
    let description: String! = nil
    
    func eventsForDate(date: Date) -> [Event] {
        var daysEvents = [Event]()
        for event in eventsList {
            if Calendar.current.isDate(event.date, inSameDayAs: date) {
                daysEvents.append(event)
            }
        }
        return daysEvents
    }
    
    func eventsForDateAndTime(date: Date, hour: Int) -> [Event] {
        var daysEvents = [Event]()
        for event in eventsList {
            if Calendar.current.isDate(event.date, inSameDayAs: date) {
                let eventHour = DailyPlannerPresenter().hourFromDate(date: event.date)
                if eventHour == hour {
                    daysEvents.append(event)
                }
            }
        }
        return daysEvents
    }
}
