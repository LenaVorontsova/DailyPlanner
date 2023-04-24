//
//  Event.swift
//  DailyPlanner
//
//  Created by Lena Vorontsova on 23.04.2023.
//

import Foundation

var eventsList = [Event]()

final class Event {
    var id: Int? = nil
    var dateStart: Date? = nil
    var dateFinish: Date? = nil
    var name: String? = nil
    var description: String? = nil
    
    func eventsForDate(date: Date) -> [Event] {
        var daysEvents = [Event]()
        for event in eventsList {
            if Calendar.current.isDate(event.dateStart!, inSameDayAs: date) || Calendar.current.isDate(event.dateFinish!, inSameDayAs: date) {
                daysEvents.append(event)
            }
        }
        return daysEvents
    }
    
    func eventsForDateAndTime(date: Date, hour: Int) -> [Event] {
        var daysEvents = [Event]()
        for event in eventsList {
            if Calendar.current.isDate(event.dateStart!, inSameDayAs: date) || Calendar.current.isDate(event.dateFinish!, inSameDayAs: date) {
                let eventHourStart = DailyPlannerPresenter().hourFromDate(date: event.dateStart!)
                let eventHourFinish = DailyPlannerPresenter().hourFromDate(date: event.dateFinish!)
                if eventHourStart == hour || eventHourFinish == hour {
                    daysEvents.append(event)
                }
            }
        }
        return daysEvents
    }
}
