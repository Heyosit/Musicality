import GameplayKit

public var highScore = 0

struct GameDataSource {
    
    var linearRandomSource: GKLinearCongruentialRandomSource!
    var soundDice: GKRandomDistribution!
    let soundHighestValue = (difficulty == .normal) ? sounds.count - 2 : sounds.count - 1
    var oldSound : Int = 0
    var gestureCounters = [0,0,0]
    
    init() {
        initializeDice()
    }
    
    mutating func initializeDice() {
        linearRandomSource = GKLinearCongruentialRandomSource()
        soundDice = GKRandomDistribution(randomSource: linearRandomSource, lowestValue: 0, highestValue: soundHighestValue )
    }
    
    mutating func nextSound() -> Int {
        
        var nextSound = soundDice.nextInt()
        if nextSound == oldSound {
            var count = 0
            while count <= soundHighestValue  {
                
                if gestureCounters[count] >= Consts.maxSameGesture {
                    while nextSound == oldSound {
                        nextSound = soundDice.nextInt()
                    }
                    count = soundHighestValue + 1
                    gestureCounters[oldSound] = 0
                    
                }
                count += 1
            }
        }else {
            resetCounters()
        }
        oldSound = nextSound
        gestureCounters[nextSound] += 1
        return nextSound
    }
    
    mutating func resetCounters() {
        for i in 0...gestureCounters.count - 1 {
            gestureCounters[i] = 0
        }
    }
}
