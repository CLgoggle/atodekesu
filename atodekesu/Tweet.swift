//
//  Tweet.swift
//  atodekesu
//
//  Created by goggle CL on 2024/08/25.
//

import Foundation
import RealmSwift

class Tweet: Object {
    @Persisted var tweetText: String?
    @Persisted var tweetImageName: String?
}
