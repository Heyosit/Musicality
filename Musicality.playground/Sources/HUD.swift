
import SpriteKit

class HUD: SKNode {
    
    let scoreNode = [SKSpriteNode(imageNamed: "0"),SKSpriteNode(imageNamed: "0"),SKSpriteNode(imageNamed: "0"),SKSpriteNode(imageNamed: "0")]
    let gameOverLabel = SKLabelCustom(name: Consts.Names.LabelNames.gameOver)
    let timerLabel = SKLabelCustom(name: Consts.Names.LabelNames.timer)
    let highScoreLabel = SKLabelCustom(name: Consts.Names.LabelNames.highScore)
    let fasterNode = SKSpriteNode(imageNamed: Consts.Names.NodesNames.faster)
    var score: Int {
        get {
            return GameManager.shared.score
        }
        set {
            GameManager.shared.score += newValue
            setScoreNode()
            if GameManager.shared.level < Consts.InitialSettings.timeToRespond.count - 1 {
                if score > Consts.InitialSettings.timeToRespond[GameManager.shared.level].points {
                    GameManager.shared.level += 1
                    faster()
                }
            }
        }
    }
    
    var timeToRespondRemaining: TimeInterval {
        get {
            return GameManager.shared.calculateTimeToRespond()
        }
        set {
            GameManager.shared.timeToRespond -= newValue
            if GameManager.shared.timeToRespond < 0 {
                GameManager.shared.timeToRespond = 0
                GameManager.shared.isGameOver = true
            }
            let rounded = (GameManager.shared.timeToRespond * 10).rounded() / 10
            timerLabel.setText(text: "\(rounded)")
        }
    }
    
    override init() {
        super.init()
        self.name = Consts.Names.NodesNames.hud
    }
    
    func setScoreNode() {
        var score = GameManager.shared.score
        var module: Int
        var divider = [1,
                       10,
                       100,
                       1000,
                       10000]
        for index in 1...divider.count - 1 {
            module = (score % divider[index]) / divider[index - 1]
            scoreNode[scoreNode.count - index].texture = SKTexture(imageNamed: String(module))
            score -= module
        }
        
    }
    
    func faster() {
        let fadeIn = SKAction.fadeIn(withDuration: 0.1)
        let beat = SKAction.scale(by: 0.5, duration: 0.3)
        let reverseBeat = SKAction.scale(by: 2, duration: 0.3)
        let beatSeq = SKAction.sequence([beat,reverseBeat])
        let repeatBeat = SKAction.repeat(beatSeq, count: 4)
        let fadeOut = SKAction.fadeOut(withDuration: 0.2)
        
        
        let actionSeq = SKAction.sequence([fadeIn,repeatBeat, fadeOut])
        fasterNode.run(actionSeq)
        
    }
    
    func setup() {
        var labelData = LabelData(name: gameOverLabel.name!, text: Consts.Texts.gameOver, position: Positions.gameOverLabel, zPosition: Z.HUD, fontSize: 110, fontColor: UIColor.red)
        gameOverLabel.setup(labelData: labelData)
        gameOverLabel.fontName = "Noteworthy-Bold"
        
        initializeGame()
        labelData = LabelData(name: timerLabel.name!, text: Consts.Texts.timer, position: Positions.timerLabel, zPosition: Z.HUD, fontSize: 70, fontColor: UIColor.blue)
        timerLabel.setup(labelData: labelData)
        timerLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        timerLabel.fontName = "Noteworthy-Bold"

        
        let highScoreText = Consts.Texts.highScore + "\(highScore)"
        labelData = LabelData(name: highScoreLabel.name!, text: highScoreText, position: Positions.highScoreLabel, zPosition: Z.HUD, fontSize: 100, fontColor: UIColor.blue)
        highScoreLabel.setup(labelData: labelData)
        highScoreLabel.setText(text: Consts.Texts.highScore + "\(highScore)")
        highScoreLabel.fontName = "Noteworthy-Bold"
        
        
        addChild(gameOverLabel)
        addChild(timerLabel)
        addChild(highScoreLabel)
        
        
        scoreNode[0].position = Positions.scoreNode
        scoreNode[0].size = Consts.Sizes.number
        
        scoreNode[1].position = Positions.scoreNode
        scoreNode[1].size = Consts.Sizes.number
        
        scoreNode[2].position = Positions.scoreNode
        scoreNode[2].size = Consts.Sizes.number
        
        scoreNode[3].position = Positions.scoreNode
        scoreNode[3].size = Consts.Sizes.number
        
        scoreNode[1].position.x = Positions.scoreNode.x + scoreNode[0].size.width + 5
        scoreNode[2].position.x = scoreNode[1].position.x + scoreNode[0].size.width + 5
        scoreNode[3].position.x = scoreNode[2].position.x + scoreNode[0].size.width + 5
        
        addChild(scoreNode[0])
        addChild(scoreNode[1])
        addChild(scoreNode[2])
        addChild(scoreNode[3])
        
        fasterNode.alpha = 0
        fasterNode.position = Positions.retryButton
        addChild(fasterNode)
        
    }
    
    func gameOver() {
        gameOverLabel.isHidden = false
        gameOverLabel.setText(text: Consts.Texts.gameOver)
        highScoreLabel.setText(text: Consts.Texts.highScore + "\(highScore)")
    }
    
    
    
    func initializeGame() {
        gameOverLabel.isHidden = true
        for index in 0...scoreNode.count - 1 {
            scoreNode[index].texture = SKTexture(imageNamed: "0")
        }
    }
    
    func resetTimer() {
        timeToRespondRemaining = GameManager.shared.resetTimer()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
