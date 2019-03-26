
import SpriteKit

class GameScreen: BaseScreen, GestureDelegate {
    
    
    // Update Timer
    var lastUpdateTime: TimeInterval = 0
    var dt : TimeInterval = 0
    var hud = HUD()
    var dataSource = GameDataSource()
    var retryNode = RetryNode()
    var soundManager = SoundManager()
    var gestureManager = GestureManager()
    
    override init() {
        super.init()
    }
    
    override func createSceneContents() {
        super.createSceneContents()
    }
    
    public override func didMove(to view: SKView) {
        //swipe setting
        setSwipeGestures(view: view)
        retryNode.setup()
        retryNode.retryButton.delegate = self
        hud.setup()
        
        self.addChild(hud)
        self.addChild(retryNode)
        if !gameManager.isGameStarted {
            gameManager.resetGame()
            startGame()
        }
    }
    
    func setSwipeGestures(view: SKView) {
        gestureManager.delegate = self
        gestureManager.setSwipeGestures(view: view)
    }
    
    func startGame() {
        gameManager.isGameStarted = true
        createNewObstacle()
    }
    
    fileprivate func createNewObstacle() {
        let newObstacle = SKAction.sequence([SKAction.wait(forDuration: gameManager.waitBetweenObstacles), SKAction.run{self.choseSoundAndWaitResponse()}])
        self.run(newObstacle)
        
    }
    
    public func swipedHorizontal(sender: UISwipeGestureRecognizer) {
        checkIfRightGesture(hapticType: GestureTypes.swipe)
    }
    
    public func swipedVertical(sender: UISwipeGestureRecognizer) {
        checkIfRightGesture(hapticType: GestureTypes.third)
    }
    
    
    
    func choseSoundAndWaitResponse() {
        let soundIndex = dataSource.nextSound()
        guard let scene = self.scene else {return}
        soundManager.playSound(index: soundIndex, scene: scene)
        
        self.gameManager.isWaiting = true
        self.waitingPlayer(hapticType: GestureTypes(rawValue: soundIndex) ?? .tap)
    }
    
    func waitingPlayer(hapticType: GestureTypes) {
        gameManager.setWaitingTypeFalse()
        gameManager.isWaitingGesture[hapticType] = true
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        checkIfRightGesture(hapticType: GestureTypes.tap)
    }
    
    
    fileprivate func checkIfRightGesture(hapticType: GestureTypes) {
        if !gameManager.isWaiting {return}
        gameManager.isWaiting = false
        if gameManager.isWaitingGesture[hapticType]! {
            addPoints(hapticType: hapticType)
            _ = gameManager.resetTimer()
            createNewObstacle()
        } else {
            gameOver()
        }
        gameManager.setWaitingTypeFalse()
    }
    
    func addPoints(hapticType: GestureTypes) {
        if hapticType == GestureTypes.tap {
            hud.score = Scores.tap
        } else if hapticType == GestureTypes.swipe {
            hud.score = Scores.swipe
        } else if hapticType == GestureTypes.third {
            hud.score = Scores.third
        }
    }
    
    public func gameOver() {
        guard let scene = self.scene else {return}
        soundManager.playSound(instrument: "Gameover", scene: scene)
        self.retryNode.changeRetryButtonVisibility()
        gameManager.gameOver()
        hud.gameOver()
    }
    
    override func buttonNodeTapped(_ sender: ButtonNode) {
        super.buttonNodeTapped(sender)
        if let name = sender.name {
            switch name {
            case Consts.Names.NodesNames.retry:
                resetGame()
            default:
                break
            }
        }
    }
    
    func resetGame(){
        hud.initializeGame()
        gameManager.resetGame()
        retryNode.changeRetryButtonVisibility()
        startGame()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func update(_ currentTime: TimeInterval) {
        if lastUpdateTime <= 0 { lastUpdateTime = currentTime }
        dt = currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        
        if !gameManager.isGameStarted {return}
        if !gameManager.isWaiting {return}
        if gameManager.isGameOver {
            gameOver()
        }
        dt = (dt * 1000).rounded() / 1000
        hud.timeToRespondRemaining = dt
    }
    
    //If The user is using voice Over
    public override func accessibilityScroll(_ direction: UIAccessibilityScrollDirection) -> Bool {
        if direction == .right || direction == .left{
            //Previous Page
            checkIfRightGesture(hapticType: GestureTypes.swipe)
        } else if direction == .down || direction == .up {
            // next page
            checkIfRightGesture(hapticType: GestureTypes.third)
        }
        
        return true
    }
}
