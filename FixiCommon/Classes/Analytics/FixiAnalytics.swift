//
//  FixiAnalytics.swift
//  IMC
//
//  Created by Adam Lovastyik on 2017. 01. 05..
//  Copyright © 2017. Decos. All rights reserved.
//

import Foundation
import Crashlytics

enum FixiAnalyticsCategory: String {
    
    case issue              = "Issue"
    case home               = "Home"
}

enum FixiAnalyticsEvent: String {
    
    case setHomeLocation    = "Set Home Location"
    
    case commentToIssue     = "Comment To Issue"
    case supportToIssue     = "Support To Issue"
    case locationOfIssue    = "Locate Issue"
    
    case searchIssue        = "Search for Issue"
    
    case reportIssue        = "Report Issue"
    
    case selectPhoto        = "Select photo"
    
    case applySorting       = "Apply Sorting"
    
    case issueOnMap         = "Issue on map"
    
    case viewSettings       = "View Settings"
    
    case goToFeedback       = "Go to Feedback"
    
}

enum FixiAnalyticsLabel: String {
    
    case searchType         = "Search Type"
    
    case reportResult       = "Result"
    case reportAuthStatus   = "Auth Status"
    
    case photoSource        = "Photo source"
    
    case sortType           = "Sort Type"
}

enum FixiAnalyticsValue: String {
    
    case success            = "Success"
    case failure            = "Failure"
    case cancelled          = "Cancelled"
    
    case loggedIn           = "Logged In"
    case anonymus           = "Anonymus"
    
    case camera             = "Camera"
    case gallery            = "Gallery"
    
    case sortByLocation     = "Current Location"
    case sortByDate         = "Date"
    case sortByPriority     = "Priority"
}

enum FixiAnalyticsAuthMethod: String {
    
    case email              = "Email"
    case facebook           = "Facebook"
    case google             = "Google"
}

enum FixiAnalyticsShareMethod: String {
    
    case facebook           = "Facebook"
    case twitter            = "Twitter"
    case other              = "Other"
}

enum FixiAnalyticsShareContent: String {
    
    case issue              = "Issue"
    case app                = "App"
}

class FixiAnalytics {

    static let categoryAttributeName = "category"
    
    class func setup() {
        
        // Set up Analytics service here if needed
        
        //        GAI.sharedInstance().tracker(withTrackingId: "UA-57509793-5")
        //        GAI.sharedInstance().dispatchInterval = 20
        //        GAI.sharedInstance().trackUncaughtExceptions = true        
    }
    
    class func track(of event: FixiAnalyticsEvent, attributes: [String: Any]?) {
        
        Answers.logCustomEvent(withName: event.rawValue, customAttributes: attributes)
        
        print("Logged Analytics event \(event) attributes \(attributes)")
    }
    
    class func track(of event: FixiAnalyticsEvent, category: FixiAnalyticsCategory?, label: FixiAnalyticsLabel?, value: Any?) {
        
        var eventAttributes = [String: Any]()
        
        if category != nil {
            eventAttributes[categoryAttributeName] = NSString(string: category!.rawValue)
        }
        
        if label != nil && value != nil {
            eventAttributes[label!.rawValue] = value!
        }
        
        track(of: event, attributes: eventAttributes)
    }
    
    class func track(of event: FixiAnalyticsEvent, category: FixiAnalyticsCategory, label: FixiAnalyticsLabel) {
        
        track(of: event, category: category, label: label, value: nil)
    }
    
    class func track(of event: FixiAnalyticsEvent, category: FixiAnalyticsCategory) {
        
        track(of: event, category: category, label: nil, value: nil)
    }
    
    class func track(of event: FixiAnalyticsEvent) {
        
        track(of: event, category: nil, label: nil, value: nil)
    }
    
    class func login(with method: FixiAnalyticsAuthMethod, success: Bool) {
        
        Answers.logLogin(withMethod: method.rawValue, success: NSNumber(value: success), customAttributes: nil)
        
        print("Logged Analytics event Login with method \(method.rawValue) success \(success)")
    }
    
    class func signup(with method: FixiAnalyticsAuthMethod, success: Bool) {
        
        Answers.logSignUp(withMethod: method.rawValue, success: NSNumber(value: success), customAttributes: nil)
        
        print("Logged Analytics event Signup with method \(method.rawValue) success \(success)")
    }
    
    class func reportIssue(with authStatus: FixiAnalyticsValue, result: FixiAnalyticsValue) {
        
        var attributes = [String: Any]()
        
        attributes[categoryAttributeName] = FixiAnalyticsCategory.issue.rawValue
        attributes[FixiAnalyticsLabel.reportAuthStatus.rawValue] = NSString(string:authStatus.rawValue)
        attributes[FixiAnalyticsLabel.reportResult.rawValue] = NSString(string:result.rawValue)
        
        track(of: .reportIssue, attributes: attributes)
    }
    
    class func share(with method: FixiAnalyticsShareMethod, contentType: FixiAnalyticsShareContent, contentId: String?) {
        
        Answers.logShare(withMethod: method.rawValue, contentName: nil, contentType: contentType.rawValue, contentId: contentId, customAttributes: nil)
        
        print("Logged Analytics event share with method \(method.rawValue) type \(contentType) contentId \(contentId)")
    }
}
