
import SpriteKit
import AVFoundation

public var sounds = [
    "Bass", "Violin", "Clarinet"]

class SoundManager {
    
    
    var player: AVAudioPlayer?
    
    
    func playSound(index: Int, scene: SKScene) {
        guard let url = Bundle.main.url(forResource: sounds[index], withExtension: "wav") else { return }
        playSoundAction(url: url, scene: scene)
    }
    
    func playSound(instrument: String, scene: SKScene) {
        guard let url = Bundle.main.url(forResource: instrument, withExtension: "wav") else { return }
        playSoundAction(url: url, scene: scene)
    }
    
    func playSoundAction(url: URL, scene: SKScene) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            let playSoundAction = SKAction.run {
                player.play()
            }
            scene.run(playSoundAction)
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
