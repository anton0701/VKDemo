//
//  Date+Utils.swift
//  Honda
//
//  Created by Anton Krylov on 05/03/2019.
//  Copyright © 2019 BrightBox. All rights reserved.
//

import Foundation

extension Date {
    var startOfDay: Date {
        return Calendar(identifier: .gregorian).startOfDay(for: self)
    }

    var endOfDay: Date {
        return Calendar(identifier: .gregorian).date(byAdding: .minute, value: -1, to: Calendar(identifier: .gregorian).startOfDay(for: self.getNextDay())) ?? self
    }

    func getNextDay() -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: 1, to: self) ?? self
    }

    var isStartOfWeek: Bool {
        return Calendar(identifier: .gregorian).component(.weekday, from: self) == Calendar.firstWeekDay()
    }

    var isEndOfWeek: Bool {
        return Calendar(identifier: .gregorian).component(.weekday, from: self) == Calendar.lastWeekDay()
    }

    var weekday: Int {
        return Calendar(identifier: .gregorian).component(.weekday, from: self)
    }

    var weekdayForWorkingHours: Int {
        return (weekday == 1) ? 7 : (weekday - 1)
    }

    var dayNumber: Int {
        return Calendar(identifier: .gregorian).ordinality(of: .day, in: .month, for: self) ?? 0
    }

    func add(minutes: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .minute, value: minutes, to: self) ?? self
    }

    func add(days: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to: self) ?? self
    }

    func remove(days: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: -days, to: self) ?? self
    }

    func stringWithFormat(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

    static func daysBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
        return components.day ?? 0
    }

    static func minutesBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
        return components.minute ?? 0
    }

    static func hoursBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
        return components.hour ?? 0
    }

    static func is24Hour() -> Bool {
        if  let dateFormat = DateFormatter.dateFormat(fromTemplate: "j", options: 0, locale: Locale.current) {
            return dateFormat.index( of: "a") == nil
        } else {
            return false
        }
    }

    static func create(from dateString: String, format: String, timezone: TimeZoneType = .local) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = timezone.timeZone

        return dateFormatter.date(from: dateString)
    }

    static func to12HourString(from string24Hours: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.locale = Locale.current
        if let date = dateFormatter.date(from: string24Hours) {
            dateFormatter.dateFormat = "hh:mm a"
            return dateFormatter.string(from: date)
        } else {
            return string24Hours
        }
    }

    static func to24HourString(from string12Hours: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.locale = Locale.current
        if let date = dateFormatter.date(from: string12Hours) {
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: date)
        } else {
            return string12Hours
        }
    }

    static func updateForHoursFormat(timeString: String) -> String {
        if (Date.is24Hour()) {
            return to24HourString(from: timeString)
        } else {
            return to12HourString(from: timeString)
        }
    }

    func configDealerDate(utcDiff: Int?) -> Date {
        //Так как DateTimePicker для получения UTC вычитает часовой пояс юзера, необходимо его вернуть и отнять часовой пояс дилера
        let secondsFromGMT = TimeZone.current.secondsFromGMT() - (utcDiff ?? 0) * Int(Date.hourInSeconds)
        return self.addingTimeInterval(TimeInterval(secondsFromGMT))
    }

    func configToDealerZone(utcDiff: Int) -> Date {
        var secondsFromGMT = TimeZone.current.secondsFromGMT()
        let utcDiffSeconds = utcDiff * Int(Date.hourInSeconds)

        secondsFromGMT = utcDiffSeconds - secondsFromGMT

        return self.addingTimeInterval(TimeInterval(secondsFromGMT))
    }

    func utcToLocalDate() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }

    func getWeekDayType() -> WeekDayType {
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: self)
        //-2 because 1st day of week is sunday and it starts from 1
        //and WeekDayType starts from monday which is 0
        return WeekDayType(rawValue: weekDay - 2) ?? .monday
    }
}
