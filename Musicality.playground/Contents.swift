//: ## Welcome to Musicality
/*:
 Listen carefully to the different **instrument** playing and use **gesture** to get points. You have very short time and it will get **shorter** progressively.
 */
//#-hidden-code
import PlaygroundSupport
import SpriteKit

func Bass() -> String {
    return Instruments.bass.rawValue
}
func Violin() -> String {
    return Instruments.violin.rawValue
}
func Drums() -> String {
    return Instruments.drum.rawValue
}
func Piano() -> String {
    return Instruments.piano.rawValue
}
func Clarinet() -> String {
    return Instruments.clarinet.rawValue
}
func FrenchHorn() -> String {
    return Instruments.frenchHorn.rawValue
}
func Hard () -> Difficulty {
    return Difficulty.hard
}
func Normal () -> Difficulty {
    return Difficulty.normal
}


//#-end-hidden-code
/*:
 - - -
 # **Customization**
 You can customize the sound for each gesture.
 * Callout(Tap):
 \
 When you hear this instrument you must **tap** the screen.
 \
 Chose the instrument that you want to use:
 */
//#-hidden-code
sounds[0] =
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, Bass(), Drums())
//#-end-hidden-code
//#-editable-code
Bass()
//#-end-editable-code
/*:
 * Callout(Horizontal swipe):
 \
 When you hear this instrument you must **swipe** **horizontally**.
 \
 It's not important if you swipe left or right, it is good anyway!
 */
//#-hidden-code
sounds[1] =
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Bass(), Drums())
//#-code-completion(identifier, show, Violin(), Piano())
//#-end-hidden-code
//#-editable-code
Violin()
//#-end-editable-code
/*:
 **Difficulty**
 \
 If you want want add more difficulty, you can set the hard mode here:
 */
//#-hidden-code
difficulty =
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Violin(), Piano())
//#-code-completion(identifier, show, Normal(), Hard())
//#-end-hidden-code
//#-editable-code
Normal()
//#-end-editable-code
/*:
 **Hard** mode makes you play with **3** different instruments and gestures instead of 2 when you play in normal mode.
 * Callout(Vertical swipe):
 \
When you hear this instrument you must **swipe** **vertically**.
 \
Again, it's not important if you swipe up or down, it is good anyway!
 */
//#-hidden-code
sounds[2] =
//#-code-completion(everything, hide)
//#-code-completion(identifier, hide, Normal(), Hard())
//#-code-completion(identifier, show, Clarinet(), FrenchHorn())
//#-end-hidden-code
//#-editable-code
Clarinet()
//#-end-editable-code
/*:
 After you started the game you **don't** need to watch the screen anymore.
\
**Just focus on the sounds!**
 \
 For a better visual experience, please, start the game in **portrait** mode
 * Callout(VoiceOver):
 If you are using *VoiceOver* use **double tap** instead of tap and **swipe with three fingers** instead of the single finger swipe, both for horizontal and vertical swipe.
 */
//: ## Enjoy!!

//#-hidden-code




let root = RootViewController()
PlaygroundPage.current.liveView = root


