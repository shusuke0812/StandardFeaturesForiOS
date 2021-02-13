//
//  Storyboard.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2021/2/10.
//

// 参考：https://github.com/kickstarter/ios-oss/blob/1ca46610dd55fa0b88195d2f0bdd17931b9de1ac/Kickstarter-iOS/Library/Storyboard.swift

import UIKit

enum Storyboard: String {
    case MainViewController
    case TapCopyViewController
    case AccordingMenuViewController
    case AlertViewController
    case CarouselViewController
    case PerformanceMeasuringViewController
    case HalfModalViewController
    case HealthCareViewController
    
    func instantiate<VC: UIViewController>(_: VC.Type, inBundle bundle: Bundle?) -> VC {
        let s = UIStoryboard(name: self.rawValue, bundle: bundle)
        guard let vc = s.instantiateInitialViewController() as? VC else {
            fatalError("Couldn't instatiate ViewController -> \(self.rawValue)")
        }
        return vc
    }
}
