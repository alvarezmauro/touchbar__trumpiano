//
//  WindowController.swift
//  TrumpBar
//
//  Created by Mauro Alvarez on 22/02/2018.
//  Copyright © 2018 Mauro Alvarez. All rights reserved.
//

import Cocoa

fileprivate extension NSTouchBarCustomizationIdentifier {
    static let touchBar = NSTouchBarCustomizationIdentifier("com.alvarezmauro.trumpbar")
}

fileprivate extension NSTouchBarItemIdentifier {
    static let TrumpChina00       = NSTouchBarItemIdentifier("TrumpChina00")
    static let TrumpChina01       = NSTouchBarItemIdentifier("TrumpChina01")
    static let TrumpChina02       = NSTouchBarItemIdentifier("TrumpChina02")
    static let TrumpChina03       = NSTouchBarItemIdentifier("TrumpChina03")
    static let TrumpChina04       = NSTouchBarItemIdentifier("TrumpChina04")
    static let TrumpChina05       = NSTouchBarItemIdentifier("TrumpChina05")
    static let TrumpChina06       = NSTouchBarItemIdentifier("TrumpChina06")
    static let TrumpChina07       = NSTouchBarItemIdentifier("TrumpChina07")
    static let TrumpChina08       = NSTouchBarItemIdentifier("TrumpChina08")

//    static let 💨       = NSTouchBarItemIdentifier("💨")
//    static let fart     = NSTouchBarItemIdentifier("fart")
//    static let dry      = NSTouchBarItemIdentifier("dry")
//    static let creamy   = NSTouchBarItemIdentifier("creamy")
}


class WindowController: NSWindowController, NSTouchBarDelegate {

    func handleTrumpQuote(sender: NSButton) {
        //let title = sender.title
        let image = sender.image!.name()!
        
        guard let sound = NSSound(named: image) else {
            return
        }
        sound.play()
    }
    
    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier    = .touchBar
//        touchBar.defaultItemIdentifiers     = [.china, .💨, .fixedSpaceSmall, .fart, .dry, .creamy]
        touchBar.defaultItemIdentifiers     = [.TrumpChina00, .TrumpChina01, .TrumpChina02, .TrumpChina03, .TrumpChina04, .TrumpChina05, .TrumpChina06]
        
        
        return touchBar
    }
    
    @available(OSX 10.12.2, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        let touchBarItem    = NSCustomTouchBarItem(identifier: identifier)

        let quote = identifier.rawValue
        let image = #imageLiteral(resourceName: quote);
        let button = NSButton(image: image, target: self, action: #selector(handleTrumpQuote))
        
        touchBarItem.view = button
        
        return touchBarItem
    }
}
