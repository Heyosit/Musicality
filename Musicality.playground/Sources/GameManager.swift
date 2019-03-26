import Foundation
public var difficulty: Difficulty =  Difficulty.normal

public class GameManager {
    static let shared = GameManager()
    var waitBetweenObstacles : TimeInterval = Consts.InitialSettings.waitBetweenObstacles
    var score: Int = Consts.InitialSettings.score
    var timeToRespond: TimeInterval = Consts.InitialSettings.timeToRespond[0].time
    var isGameStarted = false
    var isGameOver = false
    var isWaiting = false
    var isWaitingGesture: Dictionary<GestureTypes, Bool> = [
        .tap : false,
        .swipe : false,
        .third : false
    ]
    var isCompletitionComplete = true
    var level = 0
    
    func resetGame() {
        waitBetweenObstacles = Consts.InitialSettings.waitBetweenObstacles
        score = Consts.InitialSettings.score
        isGameStarted = false
        isGameOver = false
        isWaiting = false
        level = 0
        timeToRespond = Consts.InitialSettings.timeToRespond[0].time
        setWaitingTypeFalse()
    }
    
    func setWaitingTypeFalse() {
        for key in self.isWaitingGesture.keys { self.isWaitingGesture[key] = false }
    }
    
    func gameOver() {
        isGameStarted = false
        isGameOver = true
        isWaiting = false
        checkHighScore()
    }
    
    func checkHighScore() {
        if score > highScore {
            highScore = score
        }
    }
    
    func resetTimer() -> TimeInterval {
        timeToRespond = calculateTimeToRespond()
        return timeToRespond
    }
    
    func calculateTimeToRespond() -> TimeInterval {
        var time: TimeInterval
        if score <= Consts.InitialSettings.timeToRespond[level].points {
            time = Consts.InitialSettings.timeToRespond[level].time
        } else {
            time = Consts.InitialSettings.minTimeToRespond
        }
        return time
    }
}
