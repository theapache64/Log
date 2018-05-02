//
//  Log.swift
//  Banjos
//
//  Created by theapache64 on 28/04/18.
//  Copyright © 2018 cybaze. All rights reserved.
//

import Foundation


public class Log {
    
    //Type emojis
    public static var FATAL_EMOJI = "💔"
    public static var ERROR_EMOJI = "❤️"
    public static var DEBUG_EMOJI = "💙"
    public static var INFO_EMOJI = "💚"
    public static var WARNING_EMOJI = "🧡"
    public static var VERBOSE_EMOJI = "🖤"
    
    private static let TIME_FORMAT = "hh:mm:ss:SSS"
    
    //Returns current date
    private static var dateTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = TIME_FORMAT
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter.string(from: Date())
    }
    
    
    public static func with(key: String, value: String,
                            fileName: String = #file,
                            functionName: String = #function,
                            line: Int = #line) {
        Log.d("\(key) : \(value)",fileName: fileName, functionName: functionName,line: line)
    }
    
    
    /// Debug log
    ///
    /// - Parameter message: Message to be displayed
    public static func d(_ message: Any?,
                         fileName: String = #file,
                         functionName: String = #function,
                         line: Int = #line) {
        printIt(emoji: DEBUG_EMOJI, message: message, fileName: fileName, functionName: functionName, line: line)
    }
    
    /// Error log
    ///
    /// - Parameter message: Message to be displayed
    public static func e(_ message: Any?,
                         fileName: String = #file,
                         functionName: String = #function,
                         line: Int = #line) {
        printIt(emoji: ERROR_EMOJI, message: message, fileName: fileName, functionName: functionName, line: line)
    }
    
    /// Info log
    ///
    /// - Parameter message: Message to be displayed
    public static func i(_ message: Any?,
                         fileName: String = #file,
                         functionName: String = #function,
                         line: Int = #line) {
        printIt(emoji: INFO_EMOJI, message: message, fileName: fileName, functionName: functionName, line: line)
    }
    
    /// Warning log
    ///
    /// - Parameter message: Message to be displayed
    public static func w(_ message: Any?,
                         fileName: String = #file,
                         functionName: String = #function,
                         line: Int = #line) {
        printIt(emoji: WARNING_EMOJI, message: message, fileName: fileName, functionName: functionName, line: line)
    }
    
    /// Verbose log
    ///
    /// - Parameter message: Message to be displayed
    public static func v(_ message: Any?,
                         fileName: String = #file,
                         functionName: String = #function,
                         line: Int = #line) {
        printIt(emoji: VERBOSE_EMOJI, message: message, fileName: fileName, functionName: functionName, line: line)
    }
    
    
    
    /// Fatal log
    ///
    /// - Parameter message: Message to be displayed
    public static func f(_ message: Any?,
                         fileName: String = #file,
                         functionName: String = #function,
                         line: Int = #line) {
        printIt(emoji: FATAL_EMOJI, message: message, fileName: fileName, functionName: functionName, line: line)
    }
    
    private static func printIt(emoji: String, message: Any?, fileName: String, functionName: String, line: Int) {
        
        #if DEBUG
        
        print("\(emoji):\(getLoggedFrom(fileName: fileName, functionName: functionName, line: line))[\(dateTime)] : \(message ?? "nil")")
        
        #endif
        
        
    }
    
    
    /// To get logged from position
    ///
    /// - Returns: String with format fileName:methodName:lineNumber
    private static func getLoggedFrom(fileName: String, functionName: String, line: Int) -> String {
        return "\((fileName as NSString).lastPathComponent)@\(functionName)#\(line)"
    }
}
